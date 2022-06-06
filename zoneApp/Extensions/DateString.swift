//
//  DateString.swift
//  zoneApp
//
//  Created by 🧊🧊 on 6/5/22.
//

import Foundation

extension Date {
    var stringValue: String {
        return DateFormatter.localizedString(from: self, dateStyle: .medium, timeStyle: .short)
    }
}
