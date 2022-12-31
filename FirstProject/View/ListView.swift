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
        
//        let menuList = ["프로필 편집"]
        
        NavigationStack {
            List {
                Section {
                    NavigationLink() {
                        Text("프로필화면")
                    } label: {
                        HStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                                .padding(.all, 10)
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading, spacing: 3) {
                                Text("이름")
                                    .font(.system(size: 24))
                                    .fontWeight(.regular)
                            }
                            .padding(.leading, 6)
                        }
                        .padding(.vertical, 10)
                    }
                }
                    ZStack {
                        NavigationLink(destination: ProfilEditView()) {
                            Text("프로필 편집")
                        }.buttonStyle(PlainButtonStyle())
//                        .foregroundColor(.blue)
//                        .opacity(0)
                        
//                    label: {
//                            Text("프로필 편집")
//                                .padding(.vertical)
//                                .frame(maxWidth: .infinity)
//                        }
                    }
//                .resizable()
                .buttonStyle(PlainButtonStyle())
                .navigationTitle("내 정보")
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
