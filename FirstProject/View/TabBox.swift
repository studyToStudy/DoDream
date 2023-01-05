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
            NavigationStack(){
                MyProjectCard()
            }
                .tabItem {
                    Image(systemName: "pencil.line")
                }
            CalendarHomeView()
                .tabItem {
                    Image(systemName: "house")
                }
            MainView()
                .tabItem {
                    Image(systemName: "house")
                }
            ListView()
                .tabItem {
                    Image(systemName: "gear")
                }
        }
    }
}

struct TabBox_Previews: PreviewProvider {
    static var previews: some View {
        TabBox().environmentObject(ListViewModel())
    }
}
