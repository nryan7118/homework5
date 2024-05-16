//
//  IncompleteTab.swift
//  TaskList
//
//  Created by Nick Ryan on 5/10/24.
//

import SwiftUI

struct IncompleteTab: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var isPresented: Bool
    @State private var filteredTasks: [Task] = []

    var body: some View {
        NavigationView {
            VStack {
                TaskList(filteredTasks: $filteredTasks)
                    .onAppear {
                        filteredTasks = taskStore.tasks.filter { !$0.isCompleted }
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
                    .sheet(isPresented: $isPresented) {
                        AddTaskMenu(isPresented: $isPresented)
                    }
            }
            .navigationTitle("Incomplete Tasks")
        }
    }
}

struct IncompleteTab_Previews: PreviewProvider {
    static var previews: some View {
        let taskStore = TaskStore()
        return IncompleteTab(isPresented: .constant(false))
            .environmentObject(taskStore)
    }
}
