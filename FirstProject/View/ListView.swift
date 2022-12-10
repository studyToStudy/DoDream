//
//  ListView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/02.
//

import SwiftUI

struct ListView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("First section")) {
                    NavigationLink("Hi") {
                        Text("Hello")
                    }
                    NavigationLink("Hello"){
                        Text("Hello")
                    }
                }
                Section(
                    header: Text("Second section"),
                    footer: Text("Hi")
                ) {
                    Text("1")
                    Text("2")
                    Text("3")
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
