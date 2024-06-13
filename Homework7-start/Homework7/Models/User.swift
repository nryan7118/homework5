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

struct UserResults: Codable {
  let results: [User]
  let info: Info
}

struct User: Codable, Identifiable {
  let id = UUID()
  let gender: String
  let name: Name
  let location: Location
  let email: String
  let login: Login
  let dob: DOB
  let phone: String
  let cell: String
  let picture: Picture
  let nat: String
  
  init(id: UUID = UUID(), gender: String, name: Name, location: Location, email: String, login: Login, dob: DOB, phone: String, cell: String, picture: Picture, nat: String) {
    self.gender = gender
    self.name = name
    self.location = location
    self.email = email
    self.login = login
    self.dob = dob
    self.phone = phone
    self.cell = cell
    self.picture = picture
    self.nat = nat
  }
  
  struct Name: Codable {
    let title: String
    let first: String
    let last: String
  }
  
  struct Location: Codable {
    let street: Street
    let city: String
    let state: String
    let country: String
    let postcode: Int
    let coordinates: Coordinates
    let timezone: Timezone
  }
  
  struct Street: Codable {
    let number: Int
    let name: String
  }
  
  struct Timezone: Codable {
    let offset: String
    let description: String
  }
  
  struct Coordinates: Codable {
    let latitude: String
    let longitude: String
  }
  
  struct Login: Codable {
    let uuid: String
    let username: String
    let password: String
    let salt: String
    let md5: String
    let sha1: String
    let sha256: String
  }
  
  struct DOB: Codable {
    let date: String
    let age: Int
  }
  
  struct Picture: Codable {
    let large: String
    let medium: String
    let thumbnail: String
  }
}
  
  struct Info: Codable {
    let seed: String
    let results: Double
    let page: Int
    let version: String
  }
