/// Copyright (c) 2024 Kodeco Inc.
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import Foundation
import SwiftUI

class APIStore: ObservableObject {
  
  let apiJSONURL = URL(fileURLWithPath: "apilist", relativeTo: FileManager.documentsDirectoryURL).appendingPathExtension("json")
  
  @Published var apiEntries: [API] = []

  
  init() {
    if !FileManager.default.fileExists(atPath: apiJSONURL.path) {
      copyJSONToDocumentsDirectory()
    }
    loadJSON()
  }
  
 private func loadJSON() {
   let url: URL
   
   if let bundleURL = Bundle.main.url(forResource: "apilist", withExtension: "json") {
     url = bundleURL
   }
   
   else if FileManager.default.fileExists(atPath: apiJSONURL.path) {
     url = apiJSONURL
   } else {
     print("Failed to find JSON file in both bundle and documents directory")
     return
   }
   
   let decoder = JSONDecoder()
   
   do {
     let apiData = try Data(contentsOf: url)
     let apiResponse = try decoder.decode(APIResponse.self, from: apiData)
     self.apiEntries = apiResponse.entries
   } catch {
     print("Failed to decode JSON: \(error)")
   }
  }
  
  private func copyJSONToDocumentsDirectory() {
    guard let bundleURL = Bundle.main.url(forResource: "apilist", withExtension: "json") else {
      print("Failed to find JSON file in the bundle.")
      return
    }
    
    do {
      let data = try Data(contentsOf: bundleURL)
      try data.write(to: apiJSONURL)
      print("Copied JSON file from bundle to documents directory.")
      loadJSON()
     // saveAPIData()
    } catch {
      print("Falied to copy JSON file: \(error)")
    }
  }
  
  
  func addEntry(_ entry: API) {
    apiEntries.append(entry)
    saveAPIData()
  }
  
func saveAPIData() {
  let encoder = JSONEncoder()
  encoder.outputFormatting = .prettyPrinted
  
  do {
    let data = try encoder.encode(apiEntries)
    let url = getDocumentsDirectory().appendingPathComponent("apis.json")
    try data.write(to: url)
    print("Data saved to: \(url)")
  } catch {
    print("Failed to save JSON: \(error)")
  }
}
  
  private func getDocumentsDirectory() -> URL {
  let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
  return paths[0]
}
}
