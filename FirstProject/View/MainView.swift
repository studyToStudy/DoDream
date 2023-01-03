//
//  whyDoDreamView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/03.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        
        ZStack {
            VStack {
                
                Text("DoDream")
//                    .font(.system(.title, design: .rounded))
                    .font(.custom("THEGaeideuk", size: 30))
//                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                HStack {
                    
                    SubscriptionView(title: "Todo", subTitle: "9", fontColor: .black, bgColor: .green)
                    SubscriptionView(title: "Gold", subTitle: "49", fontColor: .black, bgColor: .yellow)
                    
                } //HStack
                
                SubscriptionView(title: "Titanium", subTitle: "99", fontColor: .white, bgColor: .gray)
                
                SubscriptionButton(text: "Subscribe", color: .blue, topPadding: 40, action: {
                    //Execute subscribe code
                })
                
                SubscriptionButton(text: "Maybe next time", color: .red, topPadding: 10, action: {
                    //Execute exit code
                })
                
            } //VStack
            
        } //ZStack
        
    } //body
    
} //ContentView
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


struct SubscriptionView: View {
    
    var title: String
    var subTitle: String
    var fontColor: Color
    var bgColor: Color
    
    var body: some View {
        VStack {
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .foregroundColor(fontColor)
                .fontWeight(.black)
            
            Text("\(subTitle)")
                .font(.system(.title, design: .rounded))
                .foregroundColor(fontColor)
            
            Text("per month")
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
