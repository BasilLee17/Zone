//
//  MoodViewController.swift
//  zoneApp
//
//  Created by Isabelle Donsbach on 5/29/22.
//

import UIKit

class MoodViewController: UIViewController {
    var moodEntries: [MoodEntry] = []
    
    func createEntry(mood: MoodEntry.Mood, date: Date) {
        let newEntry = MoodEntry(mood: mood, date: date)
        moodEntries.insert(newEntry, at: 0)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }
    
    func updateEntry(mood: MoodEntry.Mood, date: Date, at index: Int) {
        moodEntries[index].mood = mood
        moodEntries[index].date = date
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    func deleteEntry(at index: Int) {
        moodEntries.remove(at: index)
        tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "show new entry":
                guard let entryDetailsViewController = segue.destination as? MoodDetailedViewController else {
                    
                    //NOTE: error handling
                    return print("storyboard not set up correctly, 'show entry details' segue needs to segue to a 'MoodDetailedViewController'")
                }
                
                entryDetailsViewController.mood = MoodEntry.Mood.none
                entryDetailsViewController.date = Date()
                
            case "show entry details":
                guard
                    let selectedCell = sender as? UITableViewCell,
                    let indexPath = tableView.indexPath(for: selectedCell) else {
                        return print("failed to locate index path from sender")
                }
                
                guard let entryDetailsViewController = segue.destination as? MoodDetailedViewController else {
                    return print("storyboard not set up correctly, 'show entry details' segue needs to segue to a 'MoodDetailedViewController'")
                }
                
                let entry = moodEntries[indexPath.row]
                entryDetailsViewController.mood = entry.mood
                entryDetailsViewController.date = entry.date
                entryDetailsViewController.isEditingEntry = true
                
            default: break
            }
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func unwindToHome(_ segue: UIStoryboardSegue) {
        guard let identifier = segue.identifier else {
            return
        }
        
        guard let detailedEntryViewController = segue.source as? MoodDetailedViewController else {
            return print("storyboard unwind segue not set up correctly")
        }
        
        switch identifier {
        case "unwind from submit":
            let newMood: MoodEntry.Mood = detailedEntryViewController.mood
            let newDate: Date = detailedEntryViewController.date
            if detailedEntryViewController.isEditingEntry {
                guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
                    return
                }
                updateEntry(mood: newMood, date: newDate, at: selectedIndexPath.row)
            } else {
                createEntry(mood: newMood, date: newDate)
            }
//        case "unwind from cancel":
//            print("from cancel button")
        default:
            break
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let sadEntry = MoodEntry(mood: .sad, date: Date())
        
        moodEntries = [goodEntry, sadEntry]
        tableView.reloadData()
        
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options:[.alert,.sound]) {
            (granted,error) in
            // Code here
            if granted {
                print("All set")
            } else if let error = error {
                        print("Error: ", error)
            }
        }
        
        //notification content
        let content = UNMutableNotificationContent()
        content.title = "Start your Daily Check-In"
        content.body = "Did you meditate today?"
        
        //notification trigger
        let date = Date().addingTimeInterval(10)
        let dateComponents = Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats:false)
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //create request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content:content, trigger:trigger)
        
        //register request
        center.add(request) { (error) in
            //Check the erorr parameter and handle any errors
            
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at: selectedIndexPath, animated: true)
        }
    }
}
extension MoodViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moodEntries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood entry cell", for: indexPath) as! MoodEntryTableViewCell
        
        let entry = moodEntries[indexPath.row]
        cell.configure(entry)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEntry = moodEntries[indexPath.row]
        print("Selected mood was \(selectedEntry.mood.stringValue)")
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch editingStyle {
        case .delete:
            deleteEntry(at: indexPath.row)
        default:
            break
        }
    }
}

