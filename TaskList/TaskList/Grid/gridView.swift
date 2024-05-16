//
//  gridView.swift
//  TaskList
//
//  Created by Nick Ryan on 5/11/24.
//

import SwiftUI

// gridView.swift

import SwiftUI

struct gridView: View {
    @EnvironmentObject var taskStore: TaskStore
    @Binding var selectedCategory: String?

    var categoryRow: [GridItem] {
        [
            GridItem(.flexible(minimum: 20, maximum: 150)),
            GridItem(.flexible(minimum: 20, maximum: 150))
        ]
    }

    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                ScrollViewReader { proxy in
                    LazyVGrid(columns: categoryRow, spacing: 15) {
                        ForEach(TaskStore.categories, id: \.self) { category in
                          CategoryCardView(selectedCategory: $selectedCategory, category: category)
                                .onTapGesture {
                                    if selectedCategory == category {
                                        selectedCategory = nil
                                    } else {
                                        selectedCategory = category
                                    }
                                }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

      

#Preview {
  gridView(selectedCategory: .constant("Home"))
    .environmentObject(TaskStore())
}

