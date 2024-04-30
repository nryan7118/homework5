//
//  TaskRow.swift
//  Task List
//
//  Created by Nick Ryan on 4/21/24.
//

import SwiftUI

struct TaskRow: View {
  @ObservedObject var taskStore = TaskStore()
  let task: Task
  
  var body: some View {
    ZStack(alignment: .topLeading) {
      HStack() {
        Text(task.title)
          .font(.title2)
          .fontWeight(.semibold)
          .multilineTextAlignment(.leading)
          .frame(width: nil, height: 35.0)
        Spacer()
        Image(systemName: task.isCompleted ? "checkmark.square" : "square")
          .foregroundColor(task.isCompleted ? .green : .red)
          .padding(.horizontal)
          
      }
    }
    
  }
}

#Preview {
  TaskRow(taskStore: TaskStore(), task: Task(id: UUID(), title: "Example Task", isCompleted: false, notes: ""))
  
}

