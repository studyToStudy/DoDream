//
//  HomeView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/03.
//

import SwiftUI

struct HomeView: View {
    var card: [String] = []

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .center, spacing: 50) {
                ForEach((1..<2).reversed(), id: \.self) { cards in
                    HomeCardView()
                }
            }
            .padding(.leading, 20)
            .padding(.trailing, 20)
        }
        .padding(.top, 30)
        .padding(.bottom, 30)
        .frame(height: (UIScreen.main.bounds.width - 40) * 0.5)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView().environmentObject(ListViewModel())
    }
}
