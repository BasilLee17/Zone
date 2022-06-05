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
        }

}
