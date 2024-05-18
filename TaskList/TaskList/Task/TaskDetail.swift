//
//  TaskDetail.swift
//  Task List
//
//  Created by Nick Ryan on 4/21/24.
//

import SwiftUI

struct TaskDetail: View {
  @EnvironmentObject var taskStore: TaskStore
  @Binding var task: Task

  var body: some View {
    Form {
      Section("Title") {
        Text(task.title)
      }
      Section("Notes") {
        Text(task.notes)
      }
      Section("Category") {
        Text(task.selectedCategory)
      }
      Toggle("Completed", isOn: $task.isCompleted)
        .onChange(of: task.isCompleted) {
          taskStore.toggleTaskCompletion(taskID: task.id)
        }
    }
    .navigationTitle("Task Detail")
  }
}

#Preview {
  TaskDetail(task: .constant(Task(id: UUID(), title: "Example", isCompleted: false, notes: "", selectedCategory: "")))
}
