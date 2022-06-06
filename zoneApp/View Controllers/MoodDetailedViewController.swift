//
//  MoodDetailedViewController.swift
//  zoneApp
//
//  Created by 🧊🧊 on 6/5/22.
//

import UIKit

class MoodDetailedViewController: UIViewController {
    
    var date: Date!
    var mood: MoodEntry.Mood!
    var isEditingEntry = false
    
    private func updateUI() {
        updateMood(to: mood)
        datePicker.date = date
    }
    
    private func updateMood(to newMood: MoodEntry.Mood) {
        let unselectedColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 0)
        switch newMood {
        case .none:
            happyMoodBtn.backgroundColor = unselectedColor
            goodMoodBtn.backgroundColor = unselectedColor
            mehMoodBtn.backgroundColor = unselectedColor
            sadMoodBtn.backgroundColor = unselectedColor
            cryMoodBtn.backgroundColor = unselectedColor
        case .happy:
            happyMoodBtn.backgroundColor = newMood.colorValue
            goodMoodBtn.backgroundColor = unselectedColor
            mehMoodBtn.backgroundColor = unselectedColor
            sadMoodBtn.backgroundColor = unselectedColor
            cryMoodBtn.backgroundColor = unselectedColor
        case .good:
            happyMoodBtn.backgroundColor = unselectedColor
            goodMoodBtn.backgroundColor = newMood.colorValue
            mehMoodBtn.backgroundColor = unselectedColor
            sadMoodBtn.backgroundColor = unselectedColor
            cryMoodBtn.backgroundColor = unselectedColor
        case .meh:
            happyMoodBtn.backgroundColor = unselectedColor
            goodMoodBtn.backgroundColor = unselectedColor
            mehMoodBtn.backgroundColor = newMood.colorValue
            sadMoodBtn.backgroundColor = unselectedColor
            cryMoodBtn.backgroundColor = unselectedColor
        case .sad:
            happyMoodBtn.backgroundColor = unselectedColor
            goodMoodBtn.backgroundColor = unselectedColor
            mehMoodBtn.backgroundColor = unselectedColor
            sadMoodBtn.backgroundColor = newMood.colorValue
            cryMoodBtn.backgroundColor = unselectedColor
        case .cry:
            happyMoodBtn.backgroundColor = unselectedColor
            goodMoodBtn.backgroundColor = unselectedColor
            mehMoodBtn.backgroundColor = unselectedColor
            sadMoodBtn.backgroundColor = unselectedColor
            cryMoodBtn.backgroundColor = newMood.colorValue
        }
        mood = newMood
    }
    
    @IBOutlet weak var happyMoodBtn: UIButton!
    @IBOutlet weak var goodMoodBtn: UIButton!
    @IBOutlet weak var mehMoodBtn: UIButton!
    @IBOutlet weak var sadMoodBtn: UIButton!
    @IBOutlet weak var cryMoodBtn: UIButton!
    
    @IBAction func pressMood(_ button: UIButton) {
        switch button.tag {
        case 0:
            updateMood(to: .happy)
        case 1:
            updateMood(to: .good)
        case 2:
            updateMood(to: .meh)
        case 3:
            updateMood(to: .sad)
        case 4:
            updateMood(to: .cry)
        default:
            
            //NOTE: error handling
            print("unhandled button tag")
        }
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func datePickerDidChangeValue(_ sender: UIDatePicker) {
        date = datePicker.date
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
