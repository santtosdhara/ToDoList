//
//  ContentView.swift
//  ToDoList
//
//  Created by Dhara Santos on 1/16/25.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let title: String
    var isCompleted: Bool
}

struct ContentView: View {
    @State private var task: [Task] = [
        Task(title: "Buy groceries", isCompleted: false),
        Task(title: "Walk the dog", isCompleted: true)
    ]

    @State private var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("New task...", text: $newTaskTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())

                    Button(action: addTask) {
                        Image(systemName: "plus")
                            .padding(8)
                            .background(Color.blue)
                            .foregroundStyle(.white)
                            .clipShape(Circle())
                    }
                    .disabled(newTaskTitle.isEmpty)
                }
                .padding()

                List {
                    ForEach(task.indices, id: \.self) { index in
                        HStack {
                            Button(action: {
                                task[index].isCompleted.toggle()
                            }) {
                                Image(systemName: task[index].isCompleted ? "checkedmark.circle.fill" : "circle")
                                    .foregroundStyle(task[index].isCompleted ? .green : .gray)
                            }
                            .buttonStyle(PlainButtonStyle())

                            Text(task[index].title)
                                .strikethrough(task[index].isCompleted, color: .black)
                                .foregroundStyle(task[index].isCompleted ? .gray : .primary)
                        }
                    }
                    .onDelete(perform: deleteTask)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("ToDo List")
        }
    }

    //MARK: Methods

    //Function to add a new task to the ToDo List
    private func addTask() {
        guard !newTaskTitle.isEmpty else { return }
        let newTask = Task(title: newTaskTitle, isCompleted: false)
        task.append(newTask)
        newTaskTitle = ""
    }

    private func deleteTask(at offsets: IndexSet) {
        task.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
