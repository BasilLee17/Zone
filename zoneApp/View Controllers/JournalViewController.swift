//
//  JournalViewController.swift
//  zoneApp
//
//  Created by stlp on 6/6/22.
//

import UIKit

class JournalViewController: UIViewController {
    
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
