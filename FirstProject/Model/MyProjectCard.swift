//
//  MyProjectCard.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/26.
//

import SwiftUI

struct MyProjectCard: View {
    var body: some View {
        VStack{
            Text("구도 잡는 중")
            Text("10AM ~ 11AM")
            HStack{
                Circle().frame(width: 50, height: 50)
                Circle().frame(width: 50, height: 50)
                Circle().frame(width: 50, height: 50)
            }
        }
        .padding()
        .background(Color.yellow)
        .cornerRadius(12)
    }
}

struct MyProjectCard_Previews: PreviewProvider {
    static var previews: some View {
        MyProjectCard()
    }
}
