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

struct UserDetail: View {
  let user: User
  
  var body: some View {
      NavigationStack {
          VStack {
            List {
              Section (header: Text("Personal Information")) {
                VStack(alignment: .leading) {
                  
                    LabeledContent("Name", value: String("\(user.name.title), \(user.name.first), \(user.name.last)"))
                  
                  HStack {
                    Text("Date of Birth:")
                      .font(.headline)
                    Text("\(formattedDate(from: user.dob.date))")
                    
                    Text("Age: ")
                      .font(.headline)
                    Text("\(user.dob.age)")
                  }
                }
              }
              Section (header: Text("Location")) {
                HStack(alignment: .top) {
                  Text("Address: ")
                    .font(.headline)
                  VStack (alignment: .leading){
                    Text("\( String(user.location.street.number)) \(user.location.street.name) \n\(user.location.city) \(user.location.state) \(String(user.location.postcode))")
                  }
                }
              }
              Section(header: Text("Coordinates")) {
                VStack(alignment: .leading){
                  HStack {
                    Text("Lattitude: ")
                      .font(.headline)
                    Text("\(user.location.coordinates.latitude)")
                  }
                  HStack {
                    Text("Longitude")
                      .font(.headline)
                    Text(user.location.coordinates.longitude)
                  }
                }
              }
              Section (header: Text("Timezone")) {
                HStack {
                  Text("Offset: ")
                    .font(.headline)
                  Text(user.location.timezone.offset)
                }
                HStack {
                  Text("Description: ")
                    .font(.headline)
                  Text(user.location.timezone.description)
                }
              }
              Section(header: Text("Contact")) {
                VStack(alignment: .leading) {
                  HStack {
                    Text("Phone:")
                      .font(.headline)
                    Text(user.phone)
                  }
                  HStack {
                    Text("Cell: ")
                      .font(.headline)
                    Text(user.cell)
                  }
                  HStack {
                    Text("Email: ")
                      .font(.headline)
                    Text(user.email)
                  }
                }
              }
              Section (header: Text("Login Information")) {
                HStack(alignment: .top) {
                  Text("UUID: ")
                    .font(.headline)
                  VStack {
                    Text(user.login.uuid)
                  }
                }
                HStack {
                  Text("Username: ")
                    .font(.headline)
                  Text(user.login.username)
                }
                HStack {
                  Text("Password: ")
                    .font(.headline)
                  SecurePassword(password: user.login.password)
                }
                HStack {
                  Text("salt: ")
                    .font(.headline)
                  Text(user.login.salt)
                }
                HStack {
                  Text("md5: ")
                    .font(.headline)
                  Text(user.login.md5)
                }
                HStack {
                  Text("sha1: ")
                  Text(user.login.sha1)
                }
                HStack {
                  Text("sha256: ")
                  Text(user.login.sha256)
                }
              }
            }
          }
          .navigationTitle("User Info")
        }
      }
    
  
  func formattedDate(from dateString: String) -> String {
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    
    
    if let date = isoFormatter.date(from: dateString) {
      let dateFormatter = DateFormatter()
      dateFormatter.dateStyle = .medium
      dateFormatter.timeStyle = .none
      return dateFormatter.string(from: date)
    } else {
      return dateString
    }
  }
  
  struct SecurePassword: View {
    let password: String
    
    var body: some View {
      HStack {
        ForEach(0..<password.count, id: \.self) { _ in
          Image(systemName: "circle.fill")
            .foregroundColor(.secondary)
        }
        
      }
    }
  }
}

