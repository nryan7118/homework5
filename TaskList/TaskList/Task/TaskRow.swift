//
//  TaskRow.swift
//  Task List
//
//  Created by Nick Ryan on 4/21/24.
//

import SwiftUI

struct TaskRow: View {
  @EnvironmentObject var taskStore: TaskStore
  @Binding var task: Task
  
  var body: some View {

    HStack {
      Text(task.title)
        .font(.title2)
        .fontWeight(.bold)
        .frame(width: nil, height: 45.0)
        .background(Color(.white))
        .background(ignoresSafeAreaEdges: .all)
    }
  }
}

#Preview {
  TaskRow(task: .constant(Task(id: UUID(), title: "Test", isCompleted: true, notes: "", selectedCategory: "")))
    .environmentObject(TaskStore())
  
}



