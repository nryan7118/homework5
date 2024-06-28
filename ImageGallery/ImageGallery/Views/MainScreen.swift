//
//  MainScreen.swift
//  ImagaeGallery
//
//  Created by Nick Ryan on 6/22/24.
//

import SwiftUI

struct SearchBar: View {
  @Binding var searchQuery: String
  let onSearch: () -> Void
  
  var body: some View {
    HStack {
      TextField("Search Images...", text: $searchQuery, onCommit: {
        onSearch()
      })
      .textFieldStyle(RoundedBorderTextFieldStyle())
      .padding()
      
      Button(action: {
        onSearch()
      }) {
        Text("Search")
      }
    }
  }
}





struct ImageGrid: View {
  @ObservedObject var imageStore: ImageStore
  @State private var isDownloading = false
  @State private var downloadProgress: Float = 0.0
  
  var body: some View {
    ScrollView {
      LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))]) {
        ForEach(imageStore.photos) { photo in
          NavigationLink(destination: PhotoDetail(photo: photo)) {
            ImageSquare(photo: photo, isDownloading: $isDownloading,
                        downloadProgress: $downloadProgress, downloadAction: {
              Task {
                await download(photo: photo)
              }
            })
          }
        }
      }
    }
  }
  
  
  private func download(photo: PexelsPhoto) async {
    isDownloading = true
    
    do {
      let downloadedURL = try await imageStore.download(photoAt: URL(string: photo.src.original)!, progressHandler: { progress in
        downloadProgress = Float(progress)
      }, completionHandler: { _ in
        isDownloading = false
      })
      print("Downloaded to: \(downloadedURL)")
    } catch {
      print("Download error: \(error)")
      isDownloading = false
    }
  }
}

struct ImageSquare: View {
  let photo: PexelsPhoto
  @Binding var isDownloading: Bool
  @Binding var downloadProgress: Float
  let downloadAction: () -> Void
  
  var body: some View {
    VStack {
      AsyncImage(url: URL(string: photo.src.large)) { phase in
        switch phase {
        case .empty:
          ProgressView()
            .frame(width: 150, height: 150)
        case .success(let image):
          image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
        case.failure:
          Image(systemName: "xmark.circle")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
        @unknown default:
          EmptyView()
        }
      }
      if isDownloading {
        ProgressView(value: downloadProgress)
          .progressViewStyle(LinearProgressViewStyle())
      }
    }
    .contextMenu {
      Button("Download") {
        downloadAction()
      }
    }
  }
}
