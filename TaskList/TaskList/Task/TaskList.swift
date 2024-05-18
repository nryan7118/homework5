//
//  TaskList.swift
//  TaskList
//
//  Created by Nick Ryan on 5/13/24.
//

import SwiftUI

struct TaskList: View {
  @Binding var tasks: [Task]

  var body: some View {
    List($tasks) { $task in
      TaskListItem(taskItem: $task)
    }
  }
}

struct TaskListItem: View {
  @EnvironmentObject var taskStore: TaskStore
  @Binding var taskItem: Task

  var body: some View {
    HStack {
      NavigationLink(destination: TaskDetail(task: $taskItem)) {
        Text(taskItem.title)
          .font(.title2.bold())
          .frame(maxWidth: .infinity, alignment: .leading)
      }
      Button(action: toggleTask) {
        Image(systemName: taskItem.isCompleted ? "checkmark.square" : "square")
          .foregroundColor(taskItem.isCompleted ? .green : .red)
      }
      .buttonStyle(.plain)
    }
  }

  func toggleTask() {
    taskStore.toggleTaskCompletion(taskID: taskItem.id)
  }
}
