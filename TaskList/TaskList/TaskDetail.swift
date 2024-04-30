//
//  TaskDetail.swift
//  Task List
//
//  Created by Nick Ryan on 4/21/24.
//

import SwiftUI

struct TaskDetail: View {
  @ObservedObject var taskStore = TaskStore()
  @State private var task: Task
  
  init(taskStore: TaskStore, task: Task) {
    self.taskStore = taskStore
    self._task = State(initialValue: task)
  }
  
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
        Toggle(isOn: $task.isCompleted) {
          Text("Completed")
        }
        .onChange(of: task.isCompleted, initial: false) {
          taskStore.toggleTaskCompletion(taskID: task.id)
}
      }
      .navigationTitle("Task Detail")
    }
  }
}



