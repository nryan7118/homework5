//
//  CompletedTab.swift
//  TaskList
//
//  Created by Nick Ryan on 5/10/24.
//
import SwiftUI

struct CompletedTab: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var isPresented: Bool
    @State private var filteredTasks: [Task] = []

    var body: some View {
        
        NavigationView {
              VStack {
                  TaskList(filteredTasks: $filteredTasks)
                      .onAppear {
                          filteredTasks = taskStore.tasks.filter { $0.isCompleted }
                      }
                      .listStyle(GroupedListStyle())
                      .toolbar {
                          ToolbarItem(placement: .bottomBar) {
                              Button(action: { isPresented.toggle() }) {
                                  Image(systemName: "plus.circle.fill")
                                  Text("New Task").fontWeight(.bold)
                              }
                          }
                      }
                      .background(ignoresSafeAreaEdges: .all)
                Color(.white)
                      .sheet(isPresented: $isPresented) {
                          AddTaskMenu(isPresented: $isPresented)
                      }
              }
              .navigationTitle("Completed Tasks")
        }
      }
    }

struct CompletedTab_Previews: PreviewProvider {
    static var previews: some View {
        let taskStore = TaskStore()
        return CompletedTab(isPresented: .constant(false))
            .environmentObject(taskStore)
    }
}

