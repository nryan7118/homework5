//
//  ContentView.swift
//  Mod8JSON
//
//  Created by Nick Ryan on 6/8/24.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var universityStore = UniversityStore()
  
  
  var body: some View {
    NavigationStack {
      VStack {
        if universityStore.downloadProgress < 1.0 {
          ProgressView(value: universityStore.downloadProgress)
            .padding()
            .onAppear {
              universityStore.loadData()
            }
        } else {
          List(universityStore.universities) { university in
            NavigationLink(destination: UniversityEntryView(university: university)) {
              Text(university.name)
            }
          }
          .navigationTitle("Universities")
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
