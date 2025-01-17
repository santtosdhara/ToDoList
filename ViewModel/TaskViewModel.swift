//
//  TaskViewModel.swift
//  ToDoList
//
//  Created by Dhara Santos on 1/16/25.
//

import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    init() {
        loadTasks()
    }

    func addTask(title: String, category: String, dueDate: Date?, priority: Int) {
        let newTask = Task(title: title, category: category, dueDate: dueDate, priority: priority)
        tasks.append(newTask)
        saveTasks()
    }

    func toggleCompletion(for task: Task) {
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else { return }
        tasks[index].isCompleted.toggle()
        saveTasks()
    }

    func saveTasks() {
        do {
            let data = try JSONEncoder().encode(tasks)
            UserDefaults.standard.set(data, forKey: "tasks")
        } catch {
            print("Error encoding tasks: \(error)")
        }
    }

    func loadTasks() {
        guard let data = UserDefaults.standard.data(forKey: "tasks") else { return }
        do {
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error decoding tasks: \(error)")
        }
    }
}
