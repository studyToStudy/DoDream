//
//  ItemModel.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/06.
//

import Foundation

struct ItemModel: Identifiable {
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
