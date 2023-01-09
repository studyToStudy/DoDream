//
//  ListView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/02.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var askForAttachment = false
    
    @State var tag: Int? = nil
    
    var body: some View {
        NavigationStack {
            List {
                Text("Hello")
                Text("Hello")
                Text("Hello")
                Text("Hello")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
