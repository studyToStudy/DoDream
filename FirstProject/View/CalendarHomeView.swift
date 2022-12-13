//
//  CalendarView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/27.
//

import SwiftUI

struct CalendarHomeView: View {
    @State private var goesToDetail: Bool = false
    @State var currentDate: Date = Date()
    var body: some View {
//        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    CustomDatePicker(currentDate: $currentDate)
                }
                .padding(.vertical)
            }
            .safeAreaInset(edge: .bottom) {
                HStack {
                    NavigationLink{
                        AddView()
                    } label: {
                        Text("일정 추가")
                         .fontWeight(.bold)
                         .padding(.vertical)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue, in: Capsule())
                        
                    }
//                    Button {
//
//                    } label: {
//                        Text("일정 추가")
//                            .fontWeight(.bold)
//                            .padding(.vertical)
//                            .frame(maxWidth: .infinity)
//                            .background(Color.blue, in: Capsule())
//                    }
                    
                }
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)
                .background(.blendMode(.colorDodge))
            }
//        }
    }
}

struct CalaendarNewView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView()
    }
}
