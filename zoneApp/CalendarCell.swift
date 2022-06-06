//
//  CalendarCell.swift
//  zoneApp
//
//  Created by stlp on 5/31/22.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    @IBOutlet weak var dayOfMonth: UIButton!
    @IBOutlet weak var weekDayOfMonth: UILabel!
    
    @IBOutlet weak var moodEmoji: UILabel!
    
    @IBAction func loadDayView(_ sender: Any) {
        
    }
    //
//    func printDate() {
//        print("day: \(String(describing: dayOfMonth.text))")
//    }
}
