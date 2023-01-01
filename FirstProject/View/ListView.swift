//
//  ListView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/02.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    @State var tag: Int? = nil
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ProfilEditView()) {
                            Text("프로필 편집")
                        .font(.custom("THEGaeideuk", size: 20))
                        }.buttonStyle(PlainButtonStyle())
                NavigationLink(destination: ProfilEditView()) {
                            Text("문의")
                        .font(.custom("THEGaeideuk", size: 20))
                        }
                NavigationLink(destination: ProfilEditView()) {
                            Text("문의")
                        .font(.custom("THEGaeideuk", size: 20))
                        }
                    .buttonStyle(PlainButtonStyle())
                    .navigationTitle("설정")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
