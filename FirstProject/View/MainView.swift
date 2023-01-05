//
//  whyDoDreamView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/03.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            VStack {
                
                Text("DoDream")
                    .font(.system(.title, design: .rounded))
                    .font(.custom("THEGaeideuk", size: 30))
//                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                HStack {
                    MainViewSupport(title: "Todo", subTitle: "\($listViewModel.items.count)", fontColor: .white, bgColor: .accentColor)
                    MainViewSupport(title: "Task", subTitle: "49", fontColor: .white, bgColor: .accentColor)
                } //HStack
                
                MainViewSupport(title: "DoDream", subTitle: "", fontColor: .white, bgColor: .accentColor)
//                SubscriptionButton(text: "", color: .red, topPadding: 10, action: {
//                    //Execute exit code
//                })
                
            } //VStack
            
        } //ZStack
        
    } //body
    
} //ContentView
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(ListViewModel())
    }
}


struct MainViewSupport: View {
    
    var title: String
    var subTitle: String
    var fontColor: Color
    var bgColor: Color
//    var todoCount : Int
    
    var body: some View {
        VStack {
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .foregroundColor(fontColor)
                .fontWeight(.black)
            
            Text("\(subTitle)")
                .font(.system(.title, design: .rounded))
                .foregroundColor(fontColor)
            
            Text("남은 ToDo")
                .font(.headline)
                .foregroundColor(fontColor)
            
        } //VStack
        .frame(maxWidth: .infinity, minHeight: 150)
        .padding(30)
        .background(bgColor)
        .cornerRadius(20)
    }
    
}
