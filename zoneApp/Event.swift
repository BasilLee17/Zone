//
//  Event.swift
//  zoneApp
//
//  Created by stlp on 6/6/22.
//

import Foundation

var eventsList = [Event]()

class Event {
    var id: Int!
    var date: Date!
    var name: String!
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        for event in eventsList {
            if Calendar.current.isDate(event.date, inSameDayAs: date) {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
}
