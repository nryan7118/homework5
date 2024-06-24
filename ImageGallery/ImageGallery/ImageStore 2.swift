//
//  DownloadStore.swift
//  ImagaeGallery
//
//  Created by Nick Ryan on 6/18/24.
//

import SwiftUI
import Combine
import Foundation

@MainActor
class ImageStore: NSObject, ObservableObject, URLSessionDownloadDelegate {
  @Published var photos: [PexelsPhoto] = []
  
  private var session: URLSession
  private var progressHandler: ((Double) -> Void)?
  private var downloadTask: URLSessionDownloadTask?
  private var downloadCompletionHandler: ((URL) -> Void)?
  
  override init() {
    let sessionConfiguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfiguration, delegate: nil, delegateQueue: nil)
    super.init()
    self.session = URLSession(configuration: sessionConfiguration, delegate: self, delegateQueue: nil)
  }
  
  private var apiKey: String {
    guard let filePath = Bundle.main.path(forResource: "DownloadInfo", ofType: "plist") else {
      fatalError("Couldn't find 'DownloadInfo.plist'.")
    }
    
    let plist = NSDictionary(contentsOfFile: filePath)
    guard let value = plist?.object(forKey: "ImageAPI") as? String else {
      fatalError("Couln't find key 'ImageAPI' in DownloadInfo.plist'.")
    }
    return value
  }
  
  
  func fetchImages(query: String) async {
    print("Start fetching images for query: \(query)")
    var components = URLComponents(string: "https://api.pexels.com/v1/search")!
    
    let queryItems = [
      URLQueryItem(name: "query", value: query),
      URLQueryItem(name: "per_page", value: "15")
    ]
    
    components.queryItems = queryItems
    
    guard let url = components.url else {
      fatalError("Invalid URL")
    }
    
    print("Request URL: \(url)")
    
    var request = URLRequest(url:url)
    request.addValue(apiKey, forHTTPHeaderField: "Authorization")
    
    do {
      let (data, _) = try await URLSession.shared.data(for: request)
      
      if let jsonString = String(data: data, encoding: .utf8) {
        print("JSON Response: \(jsonString)")
      }
      
      let response = try JSONDecoder().decode(PexelsResponse.self, from: data)
      
      self.photos = response.photos
    } catch {
      print("Error fetching images: \(error)")
    }
  }
  
  func download(photoAt url: URL, progressHandler: @escaping(Double) -> Void, completionHandler: @escaping (URL) -> Void) {
    self.progressHandler = progressHandler
    self.downloadCompletionHandler = completionHandler
    let downloadTask = session.downloadTask(with: url)
    downloadTask.resume()
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
    guard let completionHandler = downloadCompletionHandler else
    { return }
    
    let fileManager = FileManager.default
    let documentsPath = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    let destinationURL = documentsPath.appendingPathComponent(location.lastPathComponent)
    
    do {
      if fileManager.fileExists(atPath: destinationURL.path) {
        try fileManager.removeItem(at: destinationURL)
      }
      try fileManager.moveItem(at: location, to: destinationURL)
      completionHandler(destinationURL)
    } catch {
      print("Error moving downloaded file: \(error)")
    }
  }
  
  func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didWriteData bytesWritten: Int64, totalBytesWritten: Int64, totalBytesExpectedToWrite: Int64) {
    let progress = Double(totalBytesWritten) / Double(totalBytesExpectedToWrite)
    progressHandler?(progress)
  }
}
    
   
 
