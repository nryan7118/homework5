//
//  selectedCategory.swift
//  TaskList
//
//  Created by Nick Ryan on 5/13/24.
//

import SwiftUI

struct SelectedCategory: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var selectedCategory: String?
    
    var body: some View {
        let filteredTasks: [Task]
        
        if let category = selectedCategory {
            filteredTasks = taskStore.tasks.filter { $0.selectedCategory == category }
        } else {
            filteredTasks = taskStore.tasks
        }
        
        return TaskList(filteredTasks: .constant(filteredTasks))
    }
}

struct SelectedCategory_Previews: PreviewProvider {
    static var previews: some View {
        SelectedCategory(selectedCategory: .constant("No Category"))
            .environmentObject(TaskStore())
    }
}
