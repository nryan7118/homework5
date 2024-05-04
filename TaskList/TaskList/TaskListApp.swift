//
//  Task_ListApp.swift
//  Task List
//
//  Created by Nick Ryan on 4/20/24.
//

import SwiftUI

@main
struct Task_ListApp: App {
  let defaultTask = Task(id: UUID(), title: "Your Task Title", isCompleted: false, notes: "Your Task Notes")

  var body: some Scene {
    WindowGroup {
      ContentView()
      
    }
  }
}
