//
//  ListView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/02.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.openURL) var openURL
    private var email = SupportEmail(toAddress: "jenghoo515@gmail.com", subject: "Support Email", messageHeader: "에러 및 건의 사항을 전달 해주세요")
    
    @State var tag: Int? = nil
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: ProfilEditView()) {
                            Text("프로필 편집")
                        .font(.custom("THEGaeideuk", size: 20))
                        }.buttonStyle(PlainButtonStyle())
//                NavigationLink(destination: ProfilEditView()) {
                            Text("앱 버전")
                        .font(.custom("THEGaeideuk", size: 20))
//                        }
                NavigationLink(destination: ProfilEditView()) {
                            Text("문의")
                        .font(.custom("THEGaeideuk", size: 20))
                        }
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
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                email.send(openURL: openURL)
                            } label: {
                                HStack {
                                    Text("문의하기")
                                    Image(systemName: "envelope.circle.fill")
                                }
                            }
                        }
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
