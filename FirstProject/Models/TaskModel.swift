//
//  TaskModel.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/05.
//

import Foundation


struct Tasks: Identifiable {
    var id : UUID = .init()
    var dateAdded: Date
    var taskName: String
    var taskDescription: String
    var taskCategory: Category
}
