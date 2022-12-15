//
//  Task.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/12.
//

import SwiftUI

// Task Model

// Total Task meta View
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

// Sample Date
struct TaskMetaData: Identifiable {
    var id = UUID().uuidString
    var task = [Task]()
    var taskDate: Date
}

func getSampleDate(offset: Int)-> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}

var tasks: [TaskMetaData] = [
    
//    TaskMetaData(task: [
//
//        Task(title: "Talk to Justice"),
//        Task(title: "iPhone 14 pro Magic Island"),
//    ], taskDate: getSampleDate(offset: 1)),
//
//    TaskMetaData(task: [
//
//        Task(title: "Learn SwiftUI")
//    ], taskDate: getSampleDate(offset: -3)),
//    TaskMetaData(task: [
//
//        Task(title: "Next Version of Swift")
//    ], taskDate: getSampleDate(offset: 10)),
//    TaskMetaData(task: [
//
//        Task(title: "Meeting with Tim Cook")
//    ], taskDate: getSampleDate(offset: -22)),
//    TaskMetaData(task: [
//
//        Task(title: "Learn Swift")
//    ], taskDate: getSampleDate(offset: 15)),
]
