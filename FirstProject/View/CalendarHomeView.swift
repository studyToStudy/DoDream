//
//  CalendarView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/27.
//

import SwiftUI

struct CalendarHomeView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                Button {
                    
                } label: {
                    Text("Add Task")
                        .fontWeight(.bold)
                        .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color("Orange"), in: Capsule())
                }
            }
        }
    }
}

struct CalaendarNewView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView()
    }
}
