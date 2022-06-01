//
//  CalendarCell.swift
//  zoneApp
//
//  Created by stlp on 5/31/22.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    @IBOutlet weak var dayOfMonth: UILabel!
    func printDate() {
        print("day: \(String(describing: dayOfMonth.text))")
    }
}
