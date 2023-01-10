//
//  DoDreamDesView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/10.
//

import SwiftUI

struct DoDreamDesView: View {

//    @EnvironmentObject var listViewModel: ListViewModel
    var card: [String] = []

  var body: some View {
    ZStack(alignment: .topLeading) {
      RoundedRectangle(cornerRadius: 20)
      .foregroundColor(Color.blue)
        VStack(alignment: .leading) {
            Text("DoDream은 여러분의 일정 관리를 도와주는 어플입니다.")
                .foregroundColor(Color.white)
                .font(Font.system(size: 22, design: .default))
                .bold()
                .lineLimit(4)
//                .frame(width: 150)
            Spacer()
            Text("쉽고 간단하게👍")
                    .font(Font.system(size: 15, design: .default))
                    .foregroundColor(Color.white)
                    .underline()
        }
      .padding(20)
    }
    .frame(width: UIScreen.main.bounds.width - 80, height: (UIScreen.main.bounds.width - 40 ) * 0.5, alignment: .center)
      
      ZStack(alignment: .topLeading) {
        RoundedRectangle(cornerRadius: 20)
        .foregroundColor(Color.blue)
        VStack(alignment: .leading) {
            Text("각 항목에 맞게 일정을 관리해 보세요")
                .foregroundColor(Color.white)
                .font(Font.system(size: 22, design: .default))
                .bold()
                .lineLimit(4)
//                .frame(width: 150)
  
          Spacer()
            Text("효율적인 일정관리📚")
            .font(Font.system(size: 15, design: .default))
            .foregroundColor(Color.white)
            .underline()
        }
        .padding(20)
      }
    .frame(width: UIScreen.main.bounds.width - 80, height: (UIScreen.main.bounds.width - 40 ) * 0.5, alignment: .center)
      
      ZStack(alignment: .topLeading) {
        RoundedRectangle(cornerRadius: 20)
        .foregroundColor(Color.blue)
        VStack(alignment: .leading) {
            Text("두드림과 함께 작은 것 부터 이루는 성취감을 얻어가세요")
          .foregroundColor(Color.white)
          .font(Font.system(size: 22, design: .default))
          .bold()
          .lineLimit(4)
//          .frame(width: 150)
  
          Spacer()
            Text("퀵메모를 활용하세요🎉")
            .font(Font.system(size: 15, design: .default))
            .foregroundColor(Color.white)
//            .underline()
        }
        .padding(20)
      }
    .frame(width: UIScreen.main.bounds.width - 80, height: (UIScreen.main.bounds.width - 40 ) * 0.5, alignment: .center)
  }
}



struct DoDreamDesView_Previews: PreviewProvider {
    static var previews: some View {
        DoDreamDesView()
//            .environmentObject(ListViewModel())
    }
}
