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

import SwiftUI

struct APIDetailView: View {
  let entry: API
  
  var body: some View {
      VStack(alignment: .leading, spacing: 12.0) {
        HStack() {
          Text("API Entry")
            .font(.largeTitle)
            .fontWeight(.bold)
          
        }
        HStack {
          Text("API: ")
            .fontWeight(.semibold)
          Text(entry.API)
        }
        HStack {
          Text("Description: ")
            .fontWeight(.semibold)
          Text(entry.Description)
        }
        HStack {
          Text("Auth: ")
            .fontWeight(.semibold)
          Text(entry.Auth.isEmpty ? "None" : entry.Auth)
        }
        HStack {
          Text("HTTPS: ")
            .fontWeight(.semibold)
          Text(entry.HTTPS ? "Yes" : "No")
        }
        HStack {
          Text("Cors: ")
            .fontWeight(.semibold)
          Text(entry.Cors)
        }
        HStack {
          Text("Category: ")
            .fontWeight(.semibold)
          Text(entry.Category)
        }
        if let url = URL(string: entry.Link) {
          Link("API Link", destination: url)
            .foregroundColor(.blue)
        } else {
          Text("Invalid URL")
            .foregroundStyle(.red)
        }
      }
      .padding(.horizontal, 25.0)
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
      
    }
}

#Preview {
  NavigationView {
    APIDetailView(entry: API(API: "Testing", Description: "Testing", Auth: "apiKey", HTTPS: true, Cors: "yes", Link: "https://example.com", Category: "testing"))
  }
}
