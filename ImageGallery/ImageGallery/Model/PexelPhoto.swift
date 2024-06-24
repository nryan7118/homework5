//
//  PexelPhoto.swift
//  ImagaeGallery
//
//  Created by Nick Ryan on 6/18/24.
//

import Foundation

struct PexelsPhoto: Codable, Identifiable {
  let id: Int
  let width: Int
  let height: Int
  let url: String
  let photographer: String
  let photographerURL: String
  let src: PhotoSrc
  
  private enum CodingKeys: String, CodingKey {
    case id, width, height, url, photographer
    case photographerURL = "photographer_url"
    case src
  }
  
  struct PhotoSrc: Codable {
    let original: String
    let large: String
    let large2x: String
    
  }
}
struct PexelsResponse: Codable {
  let totalResults: Int
  let photos: [PexelsPhoto]
  
  private enum CodingKeys: String, CodingKey {
    case totalResults = "total_results"
    case photos
  }
}


