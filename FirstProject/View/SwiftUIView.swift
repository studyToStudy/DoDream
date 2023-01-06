//
//  SwiftUIView.swift
//  DoDream
//
//  Created by 이정후 on 2023/01/06.
//

import SwiftUI
import ElegantCalendar

struct ExampleMonthlyCalendarView: View {

    // Start & End date should be configured based on your needs.
    let startDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (-30 * 36)))
    let endDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (30 * 36)))

    @ObservedObject var calendarManager = MonthlyCalendarManager(
        configuration: CalendarConfiguration(startDate: startDate,
                                             endDate: endDate))

    var body: some View {
        MonthlyCalendarView(calendarManager: calendarManager)
    }

}

struct ExampleYearlyCalendarView: View {

    // Start & End date should be configured based on your needs.
    let startDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (-30 * 36)))
    let endDate = Date().addingTimeInterval(TimeInterval(60 * 60 * 24 * (30 * 36)))

    @ObservedObject var calendarManager = YearlyCalendarManager(
        configuration: CalendarConfiguration(startDate: startDate,
                                             endDate: endDate))

    var body: some View {
        YearlyCalendarView(calendarManager: calendarManager)
    }

}
