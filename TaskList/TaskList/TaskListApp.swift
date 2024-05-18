//
//  Task_ListApp.swift
//  Task List
//
//  Created by Nick Ryan on 4/20/24.
//

import SwiftUI

@main
struct Task_ListApp: App {
  @StateObject var store = TaskStore()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(store)
    }
  }
}
