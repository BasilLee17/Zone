//
//  DayViewController.swift
//  zoneApp
//
//  Created by stlp on 6/1/22.
//

import UIKit


class DayViewController: UIViewController {
    
    @IBOutlet weak var DateLabel: UILabel!
    var message: String = ""
    var day: String = ""
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        if dateEntry["mood"] != "0" {
            setDay()
        } else {
            setError()
        }
    }
    
    func setDay() {
        DateLabel.text = dateEntry["date"]
    }
    
    func setError() {
        DateLabel.text = "You have no activity for \(String(describing: dateEntry["date"]!))"
    }
    
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        dateEntry = [:]
        self.dismiss(animated: true)
    }
}
