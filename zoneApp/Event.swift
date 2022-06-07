//
//  Event.swift
//  zoneApp
//
//  Created by stlp on 6/6/22.
//

import Foundation

var eventsList: [Event] = []

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
                event.fullDate = date
                event.date = entry.monthDayYear
                event.name = String(describing: entry.mood.stringValue)
                event.emoji = entry.mood.stringEmoji
                event.time = CalendarHelper().timeString(date: entry.date)
                print("event name: \(String(describing: event.name!) )")
                print("event date: \(event.date!)")
                print("event time: \(event.time!)")
                print("appending: \(daysEvents.count)")
                daysEvents.append(event)
            }
        }
        print("dayOfEvents: \(daysEvents.count)")
//        print("self date: \(daysEvents[0].date!)")
//        print("name: \(daysEvents[0].emoji!)")
//        for event in eventsList {
//            if Calendar.current.isDate(event.date, inSameDayAs: date) {
//                daysEvents.append(event)
//            }
//        }
        return daysEvents
    }
    
//    func eventsInList(date: Date) -> {
//
//    }
}
