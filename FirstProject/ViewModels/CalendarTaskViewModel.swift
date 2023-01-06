//
//  CalendarTaskViewModel.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/05.
//

import Foundation

class CalendarTaskViewModel: ObservableObject {
    @Published var taskItems: [Tasks] = [] {
        didSet {
//            saveTask()
        }
    }

    let tasksKey: String = "tasks_key"

    init() {
//        getTasks()
    }

//    func getTasks() {
//        guard
//            let data = UserDefaults.standard.data(forKey: tasksKey),
//            let savedItems = try? JSONDecoder().decode([Tasks].self, from: data)
//        else { return }
//
//        self.taskItems = savedItems
//    }

    func deletItem(indexSet: IndexSet) {
        taskItems.remove(atOffsets: indexSet)
    }

    func moveItem(from: IndexSet, to: Int) {
        taskItems.move(fromOffsets: from, toOffset: to)
    }
    
//    func saveTask() {
//        if let encodedData = try? JSONEncoder().encode(taskItems) {
//            UserDefaults.standard.set(encodedData, forKey: tasksKey)
//        }
//    }
}

