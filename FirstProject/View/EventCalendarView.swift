//
//  EventCalendarView.swift
//  DoDream
//
//  Created by 이정후 on 2022/12/30.
//

import SwiftUI

struct EventsCalendarView: View {
    @EnvironmentObject var eventStore: EventStore
    @State private var dateSelected: DateComponents?
    @State private var displayEvents = false
    @State private var formType: EventFormType?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                             eventStore: eventStore,
                             dateSelected: $dateSelected,
                             displayEvents: $displayEvents)
                Image("launchScreen")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }
            .sheet(item: $formType) { $0 }
            .sheet(isPresented: $displayEvents) {
                DaysEventsListView(dateSelected: $dateSelected)
                    .presentationDetents([.medium, .large])
            }
            
                .navigationTitle("Calendar View")
        }
    }
}

struct EventsCalendarView_Previews: PreviewProvider {
    static var previews: some View {
        EventsCalendarView()
            .environmentObject(EventStore(preview: true))
    }
}
