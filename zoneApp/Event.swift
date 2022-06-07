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
    var fullDate: Date!
    var date: String!
    var name: String!
    var time: String!
    var emoji: String!
    
    func eventsForDate(date: Date) -> [Event] {
        var daysEvents = [Event]()
        print("date: \(date)")
        
        var monthDay = CalendarHelper().monthDayYear(date: date)
        print("monthDay: \(monthDay)")
        print("entriesCount: \(moodEntries.count)")
        for entry in moodEntries {
            var event = Event()
            if entry.monthDayYear == monthDay {
                self.fullDate = date
                self.date = entry.monthDayYear
                self.name = String(describing: entry.mood.stringValue)
                self.emoji = entry.mood.stringEmoji
                self.time = CalendarHelper().timeString(date: entry.date)
                print("self name: \(String(describing: self.name) )")
                daysEvents.append(event)
                print("appending: \(daysEvents.count)")
            } else {
                break
            }
        }
//        for event in eventsList {
//            if Calendar.current.isDate(event.date, inSameDayAs: date) {
//                daysEvents.append(event)
//            }
//        }
        return daysEvents
    }
}
