//
//  AllTask.swift
//  TaskList
//
//  Created by Nick Ryan on 5/11/24.
//

import SwiftUI

struct AllTab: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var isPresented: Bool
    @Binding var selectedCategory: String?

    @State var searchText: String = ""

    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            NavigationView {
                VStack(spacing: 0) {
                    SearchBar(text: $searchText)
                        .padding(.top, 8)

                  
                    gridView(selectedCategory: $selectedCategory)
                        .padding(.bottom, 15)

                    ScrollViewReader { proxy in
                      if selectedCategory != nil {
                            SelectedCategory(selectedCategory: $selectedCategory)
                                .scaledToFit()
                        } else {
                            TaskList(filteredTasks: .constant(taskStore.tasks))
                        }
                    }
                    .background(Color.white) // Apply background color here if necessary
                }
                .navigationBarTitle("")
                .toolbar {
                    ToolbarItem(placement: .bottomBar) {
                        Button(action: { isPresented.toggle() }) {
                            Image(systemName: "plus.circle.fill")
                            Text("New Task")
                                .fontWeight(.bold)
                        }
                    }
                }
            }
            .sheet(isPresented: $isPresented) {
                AddTaskMenu(isPresented: $isPresented)
            }
        }
    }
}

struct AllTab_Previews: PreviewProvider {
    static var previews: some View {
        AllTab(
            isPresented: .constant(false),
            selectedCategory: .constant(nil)
        )
        .environmentObject(TaskStore())
    }
}
