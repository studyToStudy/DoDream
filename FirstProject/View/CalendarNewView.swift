//
//  CalaendarNewView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/12/11.
//

import SwiftUI

struct CalendarNewView: View {
    
    @State var currentDate: Date = Date()
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 20) {
                
                CustomDatePicker(currentDate: $currentDate)
            }
        }
    }
}

struct CalaendarNewView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarNewView()
    }
}
