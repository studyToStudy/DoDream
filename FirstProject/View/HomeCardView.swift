//
//  HomeCardView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/03.
//

import SwiftUI

struct HomeCardView: View {

    @EnvironmentObject var listViewModel: ListViewModel
    var card: [String] = []

  var body: some View {
    ZStack(alignment: .topLeading) {
      RoundedRectangle(cornerRadius: 20)
      .foregroundColor(Color.blue)
        VStack(alignment: .leading) {
            Text("DoDream 꿈을 기록하세요")
            Text("\($listViewModel.items.count)")
                .foregroundColor(Color.white)
                .font(Font.system(size: 30, design: .default))
                .bold()
                .lineLimit(4)
                .frame(width: 150)
            Spacer()
            
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
            Text("Hello")
                .foregroundColor(Color.white)
                .font(Font.system(size: 30, design: .default))
                .bold()
                .lineLimit(4)
                .frame(width: 150)
  
          Spacer()
            
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
            Text("Hi")
          .foregroundColor(Color.white)
          .font(Font.system(size: 30, design: .default))
          .bold()
          .lineLimit(4)
          .frame(width: 150)
  
          Spacer()
        }
        .padding(20)
      }
    .frame(width: UIScreen.main.bounds.width - 80, height: (UIScreen.main.bounds.width - 40 ) * 0.5, alignment: .center)
  }
}



struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView()
            .environmentObject(ListViewModel())
    }
}
