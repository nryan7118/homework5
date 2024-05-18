//
//  CategoryCardView.swift
//  TaskList
//
//  Created by Nick Ryan on 5/12/24.
//

import SwiftUI

struct CategoryCardView: View {
  @EnvironmentObject var taskStore: TaskStore
  let category: String

  var badgeCount: Int {
    taskStore.tasks.filter { $0.selectedCategory == category }.count
  }

  var body: some View {
    VStack {
      Text(category)
        .font(.title2)
        .bold()
      Text("\(badgeCount) tasks")
        .font(.caption)
        .bold()
        .foregroundColor(Color.white)
        .cornerRadius(5)
        .padding(.horizontal)      
    }
    .frame(width: 120, height: 130)
    .padding()
    .foregroundColor(Color.white)
    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue))
  }
}

#Preview {
  CategoryCardView(category: "Home")
    .environmentObject(TaskStore())
}
