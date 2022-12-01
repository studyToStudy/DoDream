//
//  TabBox.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/27.
//

import SwiftUI

struct TabBox: View {
    
    @State var selectedDate: Date = Date()
    @State private var selection = 2
    
    var body: some View {
        TabView(selection: $selection) {
            ScrollView{
                CalendarView()
            }.tabItem {
                Image(systemName: "calendar")
                Text("Calender")
            }
                .tag(1)
//            .padding(.vertical, 100)
//                .tabItem {
//                    Image(systemName: "1.square.fill")
//                    Text("Calender")
//                }
//                .padding(.vertical, 200)
            MyProjectCard()
                .tabItem {
//                    MyProjectCard()
                    Image(systemName: "pencil.line")
                    Text("Write")
                }
                .tag(2)
            Text("The Third Tab")
                .tabItem {
                    Image(systemName: "person")
                    Text("My Page")
                }
                .tag(3)
                .badge(5)
        }
    }
}

struct TabBox_Previews: PreviewProvider {
    static var previews: some View {
        TabBox()
    }
}
