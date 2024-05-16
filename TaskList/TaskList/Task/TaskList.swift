//
//  TaskList.swift
//  TaskList
//
//  Created by Nick Ryan on 5/13/24.
//

import SwiftUI

struct TaskList: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var filteredTasks: [Task]
  @State private var searchText = ""

    var body: some View {
        List {
              ForEach($filteredTasks) { $task in
                  TaskListItem(task: $task)
              }
        }
      }


struct TaskListItem: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var task: Task

    var body: some View {
        HStack {
          ZStack(alignment: .leading) {
            NavigationLink(destination: TaskDetail(task: $task)) {
              HStack {
                TaskRow(task: $task)
                Spacer()
              }

            }
          }
          ZStack(alignment: .trailing) {
            Button(action: {
              taskStore.toggleTaskCompletion(taskID: task.id)
            }) {
              Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                .foregroundColor(task.isCompleted ? .green : .red)
            }
           // .frame(width: 75)
            .buttonStyle(PlainButtonStyle())
          }

        }
      }
    }
}

struct TaskList_Previews: PreviewProvider {
    static var previews: some View {
        let taskStore = TaskStore()
        let tasks: [Task] = [
            Task(id: UUID(), title: "Task 1", isCompleted: true, notes: "This is task 1", selectedCategory: "Personal"),
            Task(id: UUID(), title: "Task 2", isCompleted: false, notes: "This is task 2", selectedCategory: "Work"),
            Task(id: UUID(), title: "Task 3", isCompleted: false, notes: "This is task 3", selectedCategory: "Home")
        ]
        let filteredTasks = Binding.constant(tasks)

        return TaskList(filteredTasks: filteredTasks)
            .environmentObject(taskStore)
    }
}

