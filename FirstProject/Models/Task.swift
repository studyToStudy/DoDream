//
//  Task.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/12.
//

import SwiftUI
//import CoreData
// Task Model

// Total Task meta View
struct Task: Identifiable {
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}


func getSampleDate(offset: Int)-> Date {
    let calendar = Calendar.current
    
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    
    return date ?? Date()
}
