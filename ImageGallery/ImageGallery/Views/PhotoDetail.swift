//
//  PhotoDetail.swift
//  ImagaeGallery
//
//  Created by Nick Ryan on 6/19/24.
//

import SwiftUI

struct PhotoDetail: View {
 let photo: PexelsPhoto
  
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: photo.src.large2x)) { image in
        image
          .resizable()
          .aspectRatio(contentMode: .fit)
      } placeholder: {
        ProgressView()
      }
      .navigationTitle(photo.photographer)
      .navigationBarTitleDisplayMode(.inline)
    }
  }
}
