//
//  MoodEntry.swift
//  zoneApp
//
//  Created by 🧊🧊 on 6/4/22.
//

import Foundation
import UIKit

struct MoodEntry{
    var mood: Mood
    var date: Date
    var dayOfMonth: String {
        return String(describing: CalendarHelper().dayOfMonth(date: date))
    }
    var month: String {
        return CalendarHelper().monthAndYear(date: date)
    }
    
    var monthDayYear: String {
        return CalendarHelper().monthDayYear(date: date)
    }
    
    
    public func setDayOfMonth(_ enteredDate: Date) -> String {
        return String(describing: CalendarHelper().dayOfMonth(date: enteredDate))
    }
    public func setMonthString(_ enteredDate: Date) -> String {
        return CalendarHelper().monthAndYear(date: enteredDate)
    }
    
        enum Mood: Int {
            case none
            case happy
            case good
            case meh
            case sad
            case cry

            var stringValue: String {
                switch self {
                case .none:
                    return ""
                case .happy:
                    return "Amazing"
                case .good:
                    return "Good"
                case .meh:
                    return "Neutral"
                case .sad:
                    return "Bad"
                case .cry:
                    return "Terrible"
                }
            }
            
//            var dayOfMonth: String {
//
//            }

            var colorValue: UIColor {
                switch self {
                case .none:
                    return .clear
                case .happy:
                    return .green
                case .good:
                    return .blue
                case .meh:
                    return .gray
                case .sad:
                    return .orange
                case .cry:
                    return .red
                }
            }
            
            var stringEmoji: String {
                switch self {
                case .none:
                    return ""
                case .happy:
                    return "😁"
                case .good:
                    return "🙂"
                case .meh:
                    return "😐"
                case .sad:
                    return "😔"
                case .cry:
                    return "😭"
                }
            }
        }

}
