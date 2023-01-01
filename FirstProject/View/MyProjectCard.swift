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
    @State private var searchQuery: String = ""
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
//        .onAppear {
//            for familiy: String in UIFont.familyNames {
//                print(familiy)
//                for names: String in UIFont.fontNames(forFamilyName: familiy) {
//                    print("=== \(names)")
//                }
//            }
//        }
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

