//
//  TaskViewModel.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/04.
//

import Foundation

class TaskViewModel : Identifiable , ObservableObject {
    
    @Published var tasks : [Tasks] = []
    
    @Published var sortType : SortType = .alphabetical
    @Published var isPresented = false
    @Published var searched = ""
    
    func addTask(task : Tasks){
        tasks.append(task)
    }
    
    func removeTask(indexAt : IndexSet){
        tasks.remove(atOffsets: indexAt)
    }
    
    func moveTask(from: IndexSet, to: Int) {
        tasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateItem(task: Tasks) {
        if let index = tasks.firstIndex(where: {$0.id == task.id}) {
            tasks[index] = task.updateCompletion()
        }
    }
    
    func sort(){
        
        switch sortType {
        case .alphabetical :
            tasks.sort(by: { $0.name < $1.name })
        case .date :
            tasks.sort(by: { $0.date > $1.date })
        case .priority :
            tasks.sort(by: { $0.priority.rawValue > $1.priority.rawValue })
        }
    }
    
}
