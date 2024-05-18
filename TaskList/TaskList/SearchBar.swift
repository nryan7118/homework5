//
//  SearchBar.swift
//  TaskList
//
//  Created by Nick Ryan on 5/16/24.
//

import SwiftUI

struct SearchBar: View {
  @Binding var text: String

  var body: some View {
    TextField("Search", text: $text)
      .padding(7)
      .padding(.horizontal, 45)
      .background(Color(.white))
      .opacity(0.8)
      .cornerRadius(8)
      .overlay {
        Image(systemName: "magnifyingglass")
          .foregroundColor(.gray)
          .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
          .padding(.horizontal)
      }
  }
}

#Preview {
  SearchBar(text: .constant("Search"))
}
