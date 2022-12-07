//
//  ListViewModel.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/07.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published var items : [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "첫번쨰", isCompleted: false),
            ItemModel(title: "두번쨰", isCompleted: true)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
}
