//
//  gridView.swift
//  TaskList
//
//  Created by Nick Ryan on 5/11/24.
//

import SwiftUI

struct GridView: View {
  @Binding var selectedCategory: String?

  var categoryRow: [GridItem] {
    [
      GridItem(.flexible(minimum: 20, maximum: 150)),
      GridItem(.flexible(minimum: 20, maximum: 150))
    ]
  }

  var body: some View {
    LazyVGrid(columns: categoryRow, spacing: 16) {
      ForEach(TaskStore.categories, id: \.self) { category in
        Button {
          if selectedCategory == category {
            selectedCategory = nil
          } else {
            selectedCategory = category
          }
        } label: {
          CategoryCardView(category: category)
        }
        .buttonStyle(.plain)
      }
    }
  }
}

#Preview {
  GridView(selectedCategory: .constant("Home"))
    .environmentObject(TaskStore())
}
