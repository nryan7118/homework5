//
//  IncompleteTab.swift
//  TaskList
//
//  Created by Nick Ryan on 5/10/24.
//

import SwiftUI

struct IncompleteTab: View {
  @EnvironmentObject var taskStore: TaskStore
  @State var tasks: [Task] = []

  var incompleteTasks: [Task] {
    taskStore.tasks.filter { $0.isCompleted == false }
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
          tasks = incompleteTasks
        }
        .onChange(of: incompleteTasks) { _, incompleteTasks in
          tasks = incompleteTasks
        }
        .navigationTitle("Incomplete Tasks")
    }
  }
}

#Preview {
  IncompleteTab(
    tasks: [
      Task(
        id: UUID(),
        title: "",
        isCompleted: false,
        notes: "",
        selectedCategory: ""
      )
    ]
  )
  .environmentObject(TaskStore())
}


struct AddTaskButton: View {
  @State var isPresented = false
  var body: some View {
    Button(action: presentAddTaskMenu) {
      Label("New Task", systemImage: "plus.circle.fill")
        .fontWeight(.bold)
    }
    .sheet(isPresented: $isPresented) {
      AddTaskMenu()
    }
  }

  func presentAddTaskMenu() {
    isPresented.toggle()
  }
}
