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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        print("day?: \(day)")
        dateLabel.text = "\(day)"
        activityLabel.text = "Your activity for this day"
        if day != "" {
            setEvents()
        } else {
            setError()
        }
        tableView.reloadData()
    }
    
    func setDay() {
        
    }
    
    func setError() {
        dateLabel.text = "You have no activity for \(day)"
    }
    
    func setEvents() -> [Event] {
        eventsList = Event().eventsForDate(date: selectedDate)
        print("set up events")
        print("event list count: \(eventsList.count)")
        return eventsList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count of events: \(eventsList.count)")
        print("count of array: \(Event().eventsForDate(date: selectedDate).count)")
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID") as! EventCell
        print("selected Date: \(selectedDate)")
        print("indexPath: \(indexPath.row)")
        print("event date: \(String(describing: eventsList[indexPath.row].date))")
        print("event date: \(String(describing: eventsList[indexPath.row].name))")
        print("event emoji: \(String(describing: eventsList[indexPath.row].name))")
        
        cell.date!.text = eventsList[indexPath.row].date
        cell.name!.text = eventsList[indexPath.row].name
        cell.emoji!.text = eventsList[indexPath.row].emoji
        cell.time!.text = eventsList[indexPath.row].time
        
        return cell
    }
    
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        self.dismiss(animated: true)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(dateLabel.text)
        tableView.reloadData()
    }
}
