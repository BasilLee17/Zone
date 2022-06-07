//
//  HistoryViewController.swift
//  zoneApp
//
//  Created by Isabelle Donsbach on 5/29/22.
//

import UIKit

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count of events: \(eventsList.count)")
        print("count of array: \(Event().eventsForDate(date: selectedDate).count)")
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath) as! EventCell
        print("selected Date: \(selectedDate)")
        print("indexPath: \(indexPath.row)")
        print("event date: \(String(describing: eventsList[indexPath.row].date))")
        cell.date!.text = eventsList[indexPath.row].date
        cell.name!.text = eventsList[indexPath.row].name
        cell.emoji!.text = eventsList[indexPath.row].emoji
        cell.time!.text = eventsList[indexPath.row].time
        
        return cell
    }
    
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    
    var totalSquares = [Date]()
    var day: String = ""
//    let tapGesture = UITapGestureRecognizer(target: HistoryViewController.self, action: #selector(tappedLabel(tapGestureRecognizer:)))
//
//    @objc func tappedLabel(tapGestureRecognizer: UITapGestureRecognizer) {
//      // do stuff here
//        print("tapped: yo")
//    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setCellsView()
        setWeekView()
        setEvents()
    }
    
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2)
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setWeekView()
    {
        totalSquares.removeAll()
        var current = CalendarHelper().sundayForDate(date: selectedDate)
        let nextSunday = CalendarHelper().addDays(date: current, days: 7)
        
        while current < nextSunday {
            totalSquares.append(current)
            current = CalendarHelper().addDays(date: current, days: 1)
        }
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let date = formatter.string(from: selectedDate)
        
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)
            + " " + CalendarHelper().yearString(date: selectedDate)
        
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    func setEvents() -> [Event] {
        eventsList = Event().eventsForDate(date: selectedDate)
        return eventsList
    }
    
    
//    func numberOfSections(in collectionView: UICollectionView) -> Int {
//        return totalSquares.count
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        totalSquares.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calCell", for: indexPath) as! CalendarCell
        
        let date = totalSquares[indexPath.item]
        print("date type: \(type(of: date))")
//        cell.dayOfMonth.setTitle(, for: .normal)
        let formattedDate = String(CalendarHelper().monthDayYear(date: date))
        cell.weekDayOfMonth.text = String(CalendarHelper().dayOfMonth(date: date))
        cell.moodEmoji.text = "🫥"
//        cell.dayOfMonth.setTitleColor(UIColor.red, for: .normal)
        
        
//        print("formattedDate type: \(type(of: formattedDate))")
//        print("label: \(formattedDate)")
        if formattedDate != "" {
            for entry in moodEntries {
//                let squareMood: Int? = Int(mood["dayOfMonth"] ?? 0)
                print("mood month: \(entry.month)")
                print("month label: \(String(describing: monthLabel.text!))")
                print("struct day type: \(type(of: entry.dayOfMonth))")
                print("totalSq num type: \(type(of: totalSquares[indexPath.item]))")
                print("squares: \(totalSquares[indexPath.item])")
                print("day: \(String(describing: entry.dayOfMonth))")

                print("struct month day: \(type(of: entry.monthDayYear))")
                print("entry month: \(entry.monthDayYear)")
                if entry.monthDayYear == formattedDate {
                    cell.moodEmoji.text = entry.mood.stringEmoji
                    print("emoji: \(entry.mood.stringEmoji)")
//                    cell.weekDayOfMonth.textColor = UIColor.systemBlue
                } else {
                    print("passed by the if statement")
                }
            }
        }
        
        if date == selectedDate {
            cell.backgroundColor = UIColor.systemGreen
//            cell.moodEmoji.text = 
            print("date print: \(CalendarHelper().monthDayYear(date: date))")
        } else {
            cell.backgroundColor = UIColor.white
        }
//        print("date: \(date)")
//        print("sel date: \(selectedDate)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedDate = totalSquares[indexPath.item]
        let selDate = CalendarHelper().monthDayYear(date: selectedDate)
        print("sel date: \(selDate)")
        collectionView.reloadData()
        tableView.reloadData()
        setEvents()
    }
    
    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {

            return CGSize(width: collectionView.bounds.size.width/3 - 25, height: collectionView.bounds.size.height/3 - 25)
      }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
    
    
    @IBAction func previousWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: -7)
        setWeekView()
    }
    
    @IBAction func nextWeek(_ sender: Any) {
        selectedDate = CalendarHelper().addDays(date: selectedDate, days: 7)
        setWeekView()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    @IBAction func dayTouchUpInside(_ sender: UIButton) {
//        print("sender: \(String(describing: sender.titleLabel?.text))")
//        var setDay: String? = nil
        var dayValue: String?
        dayValue = sender.currentTitle
//        print("day type: \(type(of: dayValue))")
//        print("day string: \(dayValue!)")
        
        let year = CalendarHelper().yearString(date: selectedDate)
        let month = CalendarHelper().monthString(date: selectedDate)
        dayReview = "\(String(describing: month)) \(String(describing: dayValue!)), \(year)"
        print("full date: \(dayReview)")
        
        for entry in moodEntries {
            if entry.monthDayYear == dayReview {
//                dateEntry = entry
                print("matched date: \(String(describing: entry.monthDayYear))")
            }
        }
    }
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        self.dismiss(animated: true)
    }
    
//    override func viewDidAppear(_ animated: Bool)
//    {
//        super.viewDidAppear(animated)
//        tableView.reloadData()
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
}
