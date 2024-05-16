//
//  TaskDetail.swift
//  Task List
//
//  Created by Nick Ryan on 4/21/24.
//

import SwiftUI

struct TaskDetail: View {
  @EnvironmentObject var taskStore: TaskStore
  @Environment(\.presentationMode) var presentationMode
  @Binding var task: Task

  
  var body: some View {
    
    NavigationView {
      var _: Bool
      Form {
        Section(header: Text("Title")) {
          Text(task.title)
        }
        Section(header: Text("Notes")) {
          Text(task.notes)
        }
        Section(header: Text("Category")) {
          Text(task.selectedCategory)
        }
        Toggle(isOn: $task.isCompleted) {
          Text("Completed")
        }
        .onChange(of: task.isCompleted, initial: false) {
          taskStore.toggleTaskCompletion(taskID: task.id)
}
      }
      .navigationTitle("Task Detail")
    }
    Button("Dismiss") {
      presentationMode.wrappedValue.dismiss()
    }
  }
}

#Preview {
  TaskDetail(task: .constant(Task(id: UUID(), title: "Example", isCompleted: false, notes: "", selectedCategory: "")))
}


