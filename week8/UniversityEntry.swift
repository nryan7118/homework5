//
//  UniversityEntry.swift
//  Mod8JSON
//
//  Created by Nick Ryan on 6/8/24.
//

import Foundation

struct UniversityEntry: Codable, Identifiable {
  
  let id = UUID()
  let stateProvince: String?
  let country: String
  let alpha2Code: String
  let domains: [String]
  let webPages: [String]
  let name: String
  
  private enum CodingKeys: String, CodingKey {
    case alpha2Code = "alpha_two_code"
    case webPages = "web_pages"
    case name
    case domains
    case country
    case stateProvince = "state-province"
  }
}
