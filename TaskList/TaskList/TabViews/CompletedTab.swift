//
//  CompletedTab.swift
//  TaskList
//
//  Created by Nick Ryan on 5/10/24.
//
import SwiftUI

struct CompletedTab: View {
  @EnvironmentObject var taskStore: TaskStore
  @State private var tasks: [Task] = []

  var completedTasks: [Task] {
    taskStore.tasks.filter { $0.isCompleted }
  }

  var body: some View {
    NavigationStack {
      TaskList(tasks: $tasks)
        .listStyle(.grouped)
        .toolbar {
          ToolbarItem(placement: .primaryAction) {
            AddTaskButton()
          }
        }
        .onAppear {
          tasks = completedTasks
        }
        .onChange(of: completedTasks) { _, completedTasks in
          tasks = completedTasks
        }
        .navigationTitle("Completed Tasks")
    }
  }
}

#Preview {
  CompletedTab()
    .environmentObject(TaskStore())
}
