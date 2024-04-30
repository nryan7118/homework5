//
//  Task.swift
//  Task List
//
//  Created by Nick Ryan on 4/20/24.
//

import Foundation

struct Task: Identifiable, Codable, Hashable {
  var id: UUID
  var title: String
  var isCompleted: Bool
  var notes: String
}



