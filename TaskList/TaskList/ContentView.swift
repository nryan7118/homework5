import SwiftUI

struct ContentView: View {
    @EnvironmentObject var taskStore: TaskStore
    @State private var isPresented = false
    @State var selectedCategory: String? = nil
  @State var searchText = ""

    var body: some View {
        TabView {
          AllTab(isPresented: $isPresented, selectedCategory: $selectedCategory)
            .tabItem {
              Image(systemName: "tray.full")
              Text("All")
            }
            IncompleteTab(isPresented: $isPresented)
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                    Text("Tasks")
                }
            CompletedTab(isPresented: $isPresented)
                .tabItem {
                    Image(systemName: "checkmark.circle")
                    Text("Completed")
                }
          
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(TaskStore())
    }
}
