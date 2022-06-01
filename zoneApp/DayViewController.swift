//
//  DayViewController.swift
//  zoneApp
//
//  Created by stlp on 6/1/22.
//

import UIKit


class DayViewController: UIViewController {
    
    var message: String = ""
    var day: String = ""
    
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        self.dismiss(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
