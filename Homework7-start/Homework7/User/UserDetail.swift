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
      List {
        Section(header: Text("Personal Information")) {
          SectionView(title: "Name", value: ("\(user.name.title), \(user.name.first), \(user.name.last)"))
          SectionView(title:"Date of Birth", value: String("\(formattedDate(from: user.dob.date))"))
          SectionView(title: "Age", value: ("\(user.dob.age)"))
        }
        Section(header: Text("Location")) {
          SectionView(title: "Address", value: "\(user.location.street.number) \(user.location.street.name), \(user.location.city) \(user.location.state) \(user.location.postcode)")
        }
        Section(header: Text("Coordinates")) {
          SectionView(title: "Latitude", value:("\(user.location.coordinates.latitude)"))
          SectionView(title: "Longitude", value: ("\(user.location.coordinates.longitude)"))
        }
        Section(header: Text("Timezone")) {
          SectionView(title: "Offset", value: user.location.timezone.offset)
          SectionView(title: "Description", value: user.location.timezone.description)
        }
        Section(header: Text("Contact")) {
          SectionView(title: "Phone", value: user.phone)
          SectionView(title: "Cell", value: user.cell)
          SectionView(title: "Email", value: user.email)
        }
        Section(header: Text("Login Information")) {
          SectionView(title: "UUID", value: user.login.uuid)
          SectionView(title: "Username", value: user.login.username)
          SectionView(title: "Password", value: "******")
          SectionView(title: "Salt", value: user.login.salt)
          SectionView(title: "MD5", value: user.login.md5)
          SectionView(title: "SHA1", value: user.login.sha1)
          SectionView(title: "SHA256", value: user.login.sha256)
        }
      }
      .navigationTitle("User Info")
    }
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



