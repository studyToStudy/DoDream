//
//  MyProjectCard.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/26.
//

import SwiftUI

struct MyProjectCard: View {
//    @State private var textName: String = ""
    @State var items: [ItemModel] = [
        ItemModel(title: "첫번쨰", isCompleted: false),
        ItemModel(title: "두번쨰", isCompleted: true)
    ]
    
    var body: some View {
        List {
            ForEach(items) { item in
                Text("Hello")
            }
//            ListLowView(title: "This is the first Title")
        }
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView()))
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyProjectCard()
        }
    }
}
