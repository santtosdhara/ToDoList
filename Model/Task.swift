//
//  Task.swift
//  ToDoList
//
//  Created by Dhara Santos on 1/16/25.
//

import Foundation

struct Task: Identifiable, Codable {
    let id: UUID
    var title: String
    var isCompleted: Bool
    var category: String
    var dueDate: Date?
    var priority: Int

    init(id: UUID = UUID(),
         title: String,
         isCompleted: Bool = false,
         category: String = "General",
         dueDate: Date? = nil,
         priority: Int = 2) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.category = category
        self.dueDate = dueDate
        self.priority = priority
    }
}
