//
//  CalendarView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/27.
//

import SwiftUI


struct CalendarView: UIViewRepresentable {
    let interval: DateInterval
    
    func makeUIView(context: Context) -> some UIView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

//struct CalendarView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalendarView(interval: <#DateInterval#>)
//    }
//}
