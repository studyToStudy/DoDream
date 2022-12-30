//
//  MyProjectCard.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/26.
//

import SwiftUI

struct MyProjectCard: View {
    @State private var searchFor: String = ""
    @EnvironmentObject var listViewModel: ListViewModel
    @AppStorage("StringKey") private var savedText : String = ""
    @State private var searchQuery: String = ""
    @State private var saveText: String = ""
    @State private var isCompleted = false
    
    var body: some View {
        NavigationStack {
            List {
            ForEach(listViewModel.items) { item in
                ListLowView(item: item)
//                    .onChange(of: text) {
//                        self.savedText = text
//                    }
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
//            ListLowView(title: "This is the first Title")
        }
            .searchable(text: $searchQuery, placement: .navigationBarDrawer(displayMode: .always))
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List⏰")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
        }
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView() {
            MyProjectCard()
        }
        .environmentObject(ListViewModel())
    }
}

