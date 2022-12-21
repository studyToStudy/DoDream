//
//  ListView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/02.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        

        
        NavigationView {
            List {
                Section(header: Text("DoDream Challenger")) {
                    NavigationLink("두드림") {
                        Text("자신만의 목표를 이뤄가려는 당신을 위해")
                            .font(.system(size: 20, weight: .black, design: .rounded))
                            .multilineTextAlignment(.center)
                    }
                    NavigationLink("천리길도 한 걸음 부터"){
                        Text("""
                             아무리 크고 많은 것이라도
                             그 처음은 아주 작은 것에서 부터 시작된다
                             """)
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .multilineTextAlignment(.center)
                    }
                    NavigationLink("쓰러뜨린 도전자들"){
                        Text("""
                             많은 문제들을 해결해 온 자
                             """)
                        .font(.system(size: 20, weight: .black, design: .rounded))
                        .multilineTextAlignment(.center)
                    }

                }
            }.navigationBarTitle("Challenge", displayMode: .inline)
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
