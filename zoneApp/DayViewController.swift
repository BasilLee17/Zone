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
        DateLabel.text = dayReview
    }
    
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        self.dismiss(animated: true)
    }
}
