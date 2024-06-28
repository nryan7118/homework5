//
//  ContentView.swift
//  ImagaeGallery
//
//  Created by Nick Ryan on 6/18/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var imageStore = ImageStore()
  @State private var searchQueary = ""
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(searchQuery: $searchQueary) {
          Task {
            await fetchImages()
          }
        }
        
        ImageGrid(imageStore: imageStore)
          .navigationTitle("Pexels Search")
      }
    }
  }
  
  private func fetchImages() async {
    do {
      await imageStore.fetchImages(query: searchQueary)
    } catch {
      print("Error fetching images: \(error)")
    }
  }
}
  
#Preview {
  ContentView()
}
