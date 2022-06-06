//
//  HistoryViewController.swift
//  zoneApp
//
//  Created by Isabelle Donsbach on 5/29/22.
//

import UIKit

//var selectedDate = Date()
//var selectedDay = Date()
//var dayReview = ""
//var moodHistory = [
//    ["date": "June 6, 2022", "mood": "1", "dayOfMonth": "6", "month": "June 2022"],
//    ["date": "June 12, 2022", "mood": "5", "dayOfMonth": "12", "month": "June 2022"],
//    ["date": "June 27, 2022", "mood": "5", "dayOfMonth": "27", "month": "June 2022"]
//]
//var dateEntry: [String:String] = [:]

class WeeklyViewController: UIViewController {
    
    @IBOutlet weak var DateLabel: UILabel!
    var message: String = ""
    var day: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        self.dismiss(animated: true)
    }
}
