//
//  DayViewController.swift
//  zoneApp
//
//  Created by stlp on 6/1/22.
//

import UIKit


class DayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
     
    @IBOutlet weak var dateLabel: UILabel!
    var message: String = ""
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var day: String = ""
    
    var events = [Event]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("day?: \(day)")
        dateLabel.text = "\(day)"
        activityLabel.text = "Your activity this day"
        initList()
        tableView.reloadData()
    }
    
    func setDay() {
        
    }
    
    func setError() {
        dateLabel.text = "You have no activity for \(day)"
    }
    
    func initList() {
        let viewList = Event().eventsForDate(date: selectedDate)
        print("set up events")
        print("event list count: \(eventsList.count)")
        eventsList = viewList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count of events: \(eventsList.count)")
        print("count of array: \(Event().eventsForDate(date: selectedDate).count)")
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell") as! EventCell
        print("selected Date: \(selectedDate)")
        print("indexPath: \(indexPath.row)")
        print("event date: \(String(describing: eventsList[indexPath.row].date))")
        print("event date: \(String(describing: eventsList[indexPath.row].name))")
        print("event emoji: \(String(describing: eventsList[indexPath.row].name))")
        
        let thisList = eventsList[indexPath.row]
        
        cell.date.text = thisList.date
        cell.name.text = thisList.name
        cell.emoji.text = thisList.emoji
        cell.time.text = thisList.time
        
        return cell
    }
    
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        eventsList = []
        selectedDate = Date()
        self.dismiss(animated: true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(dateLabel.text ?? "")
        initList()
        tableView.reloadData()
    }
}
