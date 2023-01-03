//
//  MyProjectCard.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/26.
//

import SwiftUI

struct MyProjectCard: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var saveText: String = ""
    @State private var isCompleted = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                if listViewModel.items.isEmpty {
                    NoItemView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                        .font(.custom("THEGaeideuk", size: 20))
                } else {
                    List {
                    ForEach(listViewModel.items) { item in
                        ListLowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                    print($listViewModel.items.count)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
                }
            }
        }
        .navigationTitle("Todo List⏰")
        .font(.custom("THEGaeideuk", size: 40))
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
                )
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

