//
//  CalendarHomeView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/01.
//

import SwiftUI

struct CalendarHomeView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var goesToDetail: Bool = false
    @State var currentDate: Date = Date()
    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(spacing: 20) {
                    
                    CustomDatePicker(currentDate: $currentDate)
                }
                .padding(.vertical)
                VStack {
                    Text("일정보이게")
                }
            }
    }
}

struct CalaendarNewView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarHomeView().environmentObject(ListViewModel())
    }
}
