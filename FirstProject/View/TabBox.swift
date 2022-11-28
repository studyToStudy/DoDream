//
//  TabBox.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/27.
//

import SwiftUI

struct TabBox: View {
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        TabView {
                CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calender")
                    
                }
            .padding(.vertical, 100)
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
            Text("The Third Tab")
                .tabItem {
                    Image(systemName: "person")
                    Text("My Page")
                }
                .badge(10)
        }
    }
}

struct TabBox_Previews: PreviewProvider {
    static var previews: some View {
        TabBox()
    }
}
