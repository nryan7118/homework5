//
//  AddTaskMenu.swift
//  Task List
//
//  Created by Nick Ryan on 4/21/24.
//

import SwiftUI

struct AddTaskMenu: View {
  @EnvironmentObject var taskStore: TaskStore

  @Environment(\.dismiss) var dismiss
  @State var title = ""
  @State var notes = ""
  @State var selectedCategory = "No Category"

  var isAddButtonDisabled: Bool {
    title.isEmpty
  }

  var body: some View {
    NavigationStack {
      Form {
        Section("Task Title") {
          TextField("Title", text: $title)
        }
        Section("Notes") {
          TextEditor(text: $notes)
            .frame(minHeight: 100)
            .padding(.horizontal)
        }
        Section("Category") {
          Picker("Category", selection: $selectedCategory) {
            ForEach(TaskStore.categories, id: \.self) { category in
              Text(category)
            }
          }
          .pickerStyle(.wheel)
        }
        .navigationTitle("Adding New Task")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
          ToolbarItem(placement: .cancellationAction) {
            Button("Cancel", role: .destructive, action: { dismiss() })
          }

          ToolbarItem(placement: .confirmationAction) {
            Button("Add", action: addTask)
              .disabled(isAddButtonDisabled)
          }
        }
      }
    }
  }

  private func addTask() {
    let newTask = Task(
      id: UUID(),
      title: title,
      isCompleted: false,
      notes: notes,
      selectedCategory: selectedCategory
    )
    taskStore.addTask(newTask)
    dismiss()
  }
}

#Preview {
  AddTaskMenu()
    .environmentObject(TaskStore(tasks: TaskStore.defaultTasks))
}
