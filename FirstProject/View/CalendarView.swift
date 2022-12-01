//
//  CalendarView.swift
//  FirstProject
//
//  Created by 이정후 on 2022/11/27.
//

import SwiftUI

struct CalendarView: View {
    @State var selectedDate = Date()
    var body: some View {
        VStack {
                    FormattedDate(selectedDate: selectedDate, omitTime: true)
                    Divider().frame(height: 1)
                    DatePicker("Select Date", selection: $selectedDate,
                               in: ...Date(), displayedComponents: .date)
                        .datePickerStyle(.graphical)
                    Divider()
                }
        
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView()
    }
}
