//
//  UniversityRow.swift
//  Mod8JSON
//
//  Created by Nick Ryan on 6/9/24.
//

import SwiftUI

struct UniversityRow: View {
  let title: String
  let value: String
  
    var body: some View {
      HStack() {
        Text(title)
          .fontWeight(.bold)
        Spacer()
        Text(value)
      }
    }
}

#Preview {
    UniversityRow(title: "Testing", value: "Testing")
}
