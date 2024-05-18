//
//  AllTask.swift
//  TaskList
//
//  Created by Nick Ryan on 5/11/24.
//

import SwiftUI

struct AllTab: View {
  @EnvironmentObject var taskStore: TaskStore
  @State var selectedCategory: String?

  @State var tasks: [Task] = []

  var filteredTasks: [Task] {
    if let selectedCategory {
      return taskStore.tasks.filter { $0.selectedCategory == selectedCategory }
    } else {
      return taskStore.tasks
    }
  }

  var body: some View {
    NavigationStack {
      List {
        GridView(selectedCategory: $selectedCategory)
          .listRowBackground(Color.clear)

        ForEach($tasks) { $task in
          TaskListItem(taskItem: $task)
        }
      }
      .onAppear {
        reloadTasks()
      }
      .onChange(of: taskStore.tasks) { _, _ in
        reloadTasks()
      }
      .onChange(of: selectedCategory) { _, _ in
        reloadTasks()
      }
      .listStyle(.plain)
      .toolbar {
        ToolbarItem(placement: .primaryAction) {
          AddTaskButton()
        }
      }
      .navigationTitle("All Tasks")
    }
  }

  func reloadTasks() {
    tasks = filteredTasks
  }
}

#Preview {
  AllTab()
    .environmentObject(TaskStore())
}
