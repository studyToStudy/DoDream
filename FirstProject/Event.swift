//
//  Event.swift
//  DoDream
//
//  Created by 이정후 on 2022/12/30.
//

import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case work, home, social, sport, unspecified
        
        var id: String {
            self.rawValue
        }
        
        var icon: String {
            switch self {
            case .work:
                return "🏢"
            case .home:
                return "🏡"
            case .social:
                return "🕺"
            case .sport:
                return "⚽️"
            case .unspecified:
                return "📌"
            }
        }
    }
    
    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    init(id: String = UUID().uuidString, eventType: EventType = .unspecified, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }
    
    static var sampleEvents: [Event] {
        return [
//            Event(eventType: .home, date: Date().diff(numDays: 0), note: "Take dog to groomers")
        ]
    }
    
}
