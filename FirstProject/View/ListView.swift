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
                NavigationLink(destination: NormalSettingView()) {
                    Text("두드림이란")
                }
                NavigationLink(destination: HomeView()) {
                    Text("문의")
                }
                
            }
            .navigationTitle("기타")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
