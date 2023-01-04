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
                    SubscriptionView(title: "Todo", subTitle: "\($listViewModel.items.count)", fontColor: .black, bgColor: .blue)
                    SubscriptionView(title: "Task", subTitle: "49", fontColor: .black, bgColor: .yellow)
                    
                } //HStack
                
                SubscriptionView(title: "DoDream", subTitle: "99", fontColor: .white, bgColor: .gray)
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


struct SubscriptionView: View {
    
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


struct SubscriptionButton: View {
    
    var text: String
    var color: Color
    var topPadding: CGFloat
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .padding()
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: 75)
                .background(color)
                .cornerRadius(30)
                .shadow(radius: 40)
        }
        .padding(.top, topPadding)
        .padding(.horizontal)
    }
}
