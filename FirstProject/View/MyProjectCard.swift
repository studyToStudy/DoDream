//
//  MyProjectCard.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/26.
//

import SwiftUI

struct MyProjectCard: View {
//    @State private var textName: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListLowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
//            ListLowView(title: "This is the first Title")
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyProjectCard()
        }
        .environmentObject(ListViewModel())
    }
}
