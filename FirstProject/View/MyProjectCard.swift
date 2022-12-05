//
//  MyProjectCard.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/26.
//

import SwiftUI

struct MyProjectCard: View {
    @State private var textName: String = ""
    
    var body: some View {
        List {
            ListLowView(title: "This is the first Title")
        }
        .navigationTitle("Todo List")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add", destination: Text("Destination")))
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyProjectCard()
        }
    }
}
