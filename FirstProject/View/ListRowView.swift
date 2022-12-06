//
//  ListRowView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/05.
//

import SwiftUI

struct ListLowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListLowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "첫번쨰 아이템", isCompleted: false)
    static var item2 = ItemModel(title: "듀번쨰 아이템", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListLowView(item: item1)
            ListLowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
