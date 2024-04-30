//
//  ContentView.swift
//  Task List
//
//  Created by Nick Ryan on 4/20/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading) {
                        Text("My Tasks")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .multilineTextAlignment(.leading)
                            .padding(.trailing)
                        
                        ForEach(taskStore.tasks, id: \.self) { task in
                            NavigationLink(destination: TaskDetail(taskStore: taskStore, task: task)) {
                                TaskRow(taskStore: taskStore, task: task)
                            }
                            Divider()
                        }
                    }
                    .padding(.horizontal)
                    .sheet(isPresented: $isPresented) {
                        AddTaskMenu(taskStore: taskStore, isPresented: $isPresented)
                    }
                    .padding(.top)
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
            }
            .padding(.leading)
            
        }
      HStack {
        Button(action: { isPresented.toggle() }) {
          Image(systemName: "plus.circle.fill")
          Text("New Task")
            .fontWeight(.bold)
        }
        .padding()
        Spacer()
      }
    }
}

#Preview {
    ContentView()
}
