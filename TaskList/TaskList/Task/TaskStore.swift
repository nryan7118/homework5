//
//  TaskStore.swift
//  Task List
//
//  Created by Nick Ryan on 4/20/24.
//

import Foundation

class TaskStore: ObservableObject  {
  @Published var tasks: [Task]
  
  init(tasks: [Task]) {
    self.tasks = tasks
  }
  
  static let taskKey = "Task"
  static let defaultTasks = [
    Task(id: UUID(), title: "Do Laundry", isCompleted: false, notes: "None", selectedCategory: "Home"),
    Task(id: UUID(), title: "Am Study Session", isCompleted: false, notes: "Stop between 7:15 and 7:30 for before work break", selectedCategory: "School"),
    Task(id: UUID(), title: "Fill Water B4 Work", isCompleted: false, notes: "Aqua", selectedCategory: "Personal"),
    Task(id: UUID(), title: "Let dogs out", isCompleted: false, notes: "Who let the dogs out?", selectedCategory: "Home"),
    Task(id: UUID(), title: "Mental High Five", isCompleted: false, notes: "Good Job!", selectedCategory: "No Category")
  ]
  
  static let categories: [String] = ["Personal",  "Work", "Home", "No Category"]

  
  static func loadTasks() -> [Task] {
    guard let savedTasksData = UserDefaults.standard.object(forKey: TaskStore.taskKey) as? Data else {
      return defaultTasks
    }
    
    let decoder = JSONDecoder()
    if let savedTasks = try? decoder.decode([Task].self, from: savedTasksData) {
      return savedTasks
    } else {
      return defaultTasks
    }
  }

  
  init() {
    self.tasks = TaskStore.loadTasks()
  }
  
  func addTask(_ task: Task) {
    tasks.append(task)
    persistTasks()
    
  }
  
  func toggleTaskCompletion(taskID: UUID) {
      if let index = tasks.firstIndex(where: { $0.id == taskID }) {
          tasks[index].isCompleted.toggle()
          persistTasks()
      }
  }
  
   func persistTasks() {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(tasks) {
      UserDefaults.standard.set(encoded, forKey: TaskStore.taskKey)
    }
  }
  
}
