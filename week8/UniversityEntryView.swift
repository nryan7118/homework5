//
//  UniversityEntryView.swift
//  Mod8JSON
//
//  Created by Nick Ryan on 6/8/24.
//

import SwiftUI

struct UniversityEntryView: View {
  let university: UniversityEntry
  
  var body: some View {
    NavigationStack {
      VStack (alignment: .leading, spacing: 16.0) {
        UniversityRow(title: "Name:", value: university.name)
        UniversityRow(title: "State:", value: university.stateProvince ?? "Not Available")
        UniversityRow(title: "Country:", value: university.country)
        UniversityRow(title: "Domains:", value:String(" \(university.domains.joined(separator: ", "))"))
        UniversityRow(title: "Web Pages", value: String("\(university.webPages.joined(separator: ", "))"))
      }
      .navigationTitle("\(university.name)")
    }
    
  }
}


#Preview {
  UniversityEntryView(university: UniversityEntry(stateProvince: "OH", country: "United States", alpha2Code: "US", domains: ["ohiostate.edu"], webPages: ["theohiostate.edu"], name: "Ohio State"))
}
