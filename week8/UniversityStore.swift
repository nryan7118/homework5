//
//  UniversityStore.swift
//  Mod8JSON
//
//  Created by Nick Ryan on 6/9/24.
//

import Foundation
import SwiftUI

class UniversityStore: ObservableObject {
  @Published var universities: [UniversityEntry] = []
  @Published var downloadProgress: Float = 0
  
  private let decoder = JSONDecoder()
  private let session: URLSession
  private let sessionConfirguration: URLSessionConfiguration
  
  init() {
    self.sessionConfirguration = URLSessionConfiguration.default
    self.session = URLSession(configuration: sessionConfirguration)
  }
  
  func fetchDomain() async throws {
    
    guard let url = URL(string:  "http://universities.hipolabs.com/search?country=United+States")
    else {
      print("Invalid URL")
      return
    }
    
    let request = URLRequest(url: url)
    let (asyncBytes, response) = try await session.bytes(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse,
          httpResponse.statusCode == 200
    else {
      print("Invalid response code.")
      
      return
    }
    
    let contentLength = Float(response.expectedContentLength)
    var data = Data(capacity: Int(contentLength))
    
    for try await byte in asyncBytes {
      data.append(byte)
      
      let currentProgress = Float(data.count) / contentLength
      
      DispatchQueue.main.async {
        self.downloadProgress = currentProgress
      }
      
    }
      
      let universities = try decoder.decode([UniversityEntry].self, from: data)
      
      DispatchQueue.main.async {
        self.universities = universities
      }
    }
    
    
    func loadData() {
      Task {
        do {
          try await fetchDomain()
          for (index, university) in universities.enumerated() {
            print("\(index + 1) \(university.name)")
          }
        } catch {
          print("Failed to fetch data: \(error.localizedDescription)")
        }
      }
    }
  }
