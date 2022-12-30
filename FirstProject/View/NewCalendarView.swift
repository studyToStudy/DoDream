//
//  NewCalendarView.swift
//  DoDream
//
//  Created by 이정후 on 2022/12/30.
//

import SwiftUI

struct NewCalendarView: UIViewRepresentable {
    let interval: DateInterval
    
    func makeUIView(context: Context) -> UICalendarView {
            let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    

    

}
