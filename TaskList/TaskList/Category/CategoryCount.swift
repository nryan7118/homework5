//
//  CategoryCount.swift
//  TaskList
//
//  Created by Nick Ryan on 5/12/24.
//
//
//import SwiftUI
//
//struct CategoryCount: View {
//  @EnvironmentObject var taskStore: TaskStore
//  var body: some View {
//    let categoryCounts = countTasksByCategory()
//    
//    VStack {
//      ForEach(categoryCounts.keys.sorted(), id: \.self) { category in
//        Text("\(category): \(categoryCounts[category] ?? 0)")
//      }
//    }
//  }
//
//  func countTasksByCategory() -> [String: Int] {
//    var categoryCounts 
//    
//  }
//}
//
//#Preview {
//    CategoryCount()
//    .environmentObject(TaskStore())
//}
