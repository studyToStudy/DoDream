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
                    Image(systemName: "1.square.fill")
                    Text("Calender")
                    
                }
            .padding(.vertical, 100)
//                .tabItem {
//                    Image(systemName: "1.square.fill")
//                    Text("Calender")
//                }
//                .padding(.vertical, 200)
            Text("The Second Tab")
                .tabItem {
                    Image(systemName: "2.square.fill")
                    Text("Write")
                }
            Text("The Third Tab")
                .tabItem {
                    Image(systemName: "3.square.fill")
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
