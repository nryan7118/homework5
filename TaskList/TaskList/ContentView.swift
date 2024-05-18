import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      AllTab()
        .tabItem {
          Label("All", systemImage: "tray.full")
        }
      IncompleteTab()
        .tabItem {
          Label("Tasks", systemImage: "list.bullet.circle")
        }
      CompletedTab()
        .tabItem {
          Label("Completed", systemImage: "checkmark.circle")
        }
    }
  }
}

#Preview {
  ContentView()
    .environmentObject(TaskStore())
}
