//
//  AddTaskMenu.swift
//  Task List
//
//  Created by Nick Ryan on 4/21/24.
//

import SwiftUI

struct AddTaskMenu: View {
  static let defaultTaskTitle = "Give yourself a highfive!"
  
  @EnvironmentObject var taskStore: TaskStore
  
  @Binding var isPresented: Bool
  @State var title = ""
  @State var notes = ""
  @State var selectedCategory = "No Category"
  
  var isAddButtonDisabled: Bool {
    title.isEmpty
  }
  
  
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("Task Title")) {
          TextField("Title", text: $title)
        }
        Section(header: Text("Notes")) {
          TextEditor(text: $notes)
            .frame(minHeight: 100)
            .padding(.horizontal)
        }
        Section(header: Text("Category")) {
          Picker("Category", selection: $selectedCategory) {
            ForEach(TaskStore.categories, id: \.self) { category in
              Text(category)
            }
          }
          .pickerStyle(.wheel)
        }
        
        .navigationTitle(Text("Adding New Task"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
          leading:
            Button(action: {isPresented.toggle()}) {
              Text("Cancel")
            } ,
          trailing:
            Button(action: {
              addTask()
            }) {
              Text("Add")
            }
            .disabled(isAddButtonDisabled)
        )
      }
      }
    }
  
  private func addTask() {
      let newTask = Task(id: UUID(), title: title.isEmpty ? AddTaskMenu.defaultTaskTitle : title, isCompleted: false, notes: notes, selectedCategory: selectedCategory)
      taskStore.addTask(newTask)
      isPresented.toggle()
  }
}
  
#Preview {
  AddTaskMenu(isPresented: .constant(true))
    .environmentObject(TaskStore(tasks: TaskStore.defaultTasks))
}

