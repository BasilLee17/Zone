//
//  HistoryViewController.swift
//  zoneApp
//
//  Created by Isabelle Donsbach on 5/29/22.
//

import UIKit

var selectedDate = Date()
var selectedDay = Date()
var dayReview = ""
var dateReview = ""
var moodHistory = [
    ["date": "June 6, 2022", "mood": "1", "dayOfMonth": "6", "month": "June 2022"],
    ["date": "June 12, 2022", "mood": "5", "dayOfMonth": "12", "month": "June 2022"],
    ["date": "June 27, 2022", "mood": "5", "dayOfMonth": "27", "month": "June 2022"]
]
var dayEntry: [String:String] = [:]
var dateEntry: String = ""

class HistoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var numDayProgress: UILabel!
    
    @IBOutlet weak var numWeeklyProgress: UILabel!
    
    var totalSquares = [String]()
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
        setMonthView()
//        print("moodEntry string value: \(moodEntries[0].mood) \(moodEntries[0].dayOfMonth)")
        print("moodEntries: \(moodEntries)")
    }
    
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 7
        let height = (collectionView.frame.size.height - 2) / 7
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setMonthView()
    {
        totalSquares.removeAll()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let date = formatter.string(from: selectedDate)
        print("selectedDate: \(selectedDate)")
        print("typeof: \(type(of: selectedDate.description)) \(type(of: selectedDate))")
        print("date string: \(date) \(type(of: date))")
        
        let daysInMonth = CalendarHelper().daysInMonth(date: selectedDate)
        let firstDayOfMonth = CalendarHelper().firstOfMonth(date: selectedDate)
        let startingSpaces = CalendarHelper().weekDay(date: firstDayOfMonth)
        
        var count: Int = 1
        
        while(count != daysInMonth) {
            totalSquares.append(String(count))
            count += 1
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)
            + " " + CalendarHelper().yearString(date: selectedDate)
        
        let initProgress = CalendarHelper().totalDayProgress(entries: moodEntries)
        numDayProgress.text = String(describing: initProgress)
        let doubleValue = Double(initProgress) / Double(7)
        let weeklyProgress = round(doubleValue * 10) / 10.0
        numWeeklyProgress.text = String(describing: weeklyProgress)
        
        collectionView.reloadData()
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
        
        cell.dayOfMonth.setTitle("\(totalSquares[indexPath.item])", for: .normal)
        cell.moodEmoji.text = String(describing: "🫥")
//        cell.dayOfMonth.setTitleColor(UIColor(, for: .normal)
        print("num square: \(totalSquares[indexPath.item])")
        if totalSquares[indexPath.item] != "" {
            let currentMonth = monthLabel.text
//            for mood in moodHistory {
////                let squareMood: Int? = Int(mood["dayOfMonth"] ?? 0)
////                print("mood month: \(mood["month"])")
////                print("month label: \(String(describing: monthLabel.text))")
//                if mood["dayOfMonth"]! == totalSquares[indexPath.item] && mood["month"] == monthLabel.text {
//                    print("day: \(String(describing: mood["dayOfMonth"]!))")
//                    print("squares: \(totalSquares[indexPath.item])")
//                    switch mood["mood"] {
//                    case "1":
//                        cell.moodEmoji.text = "😭"
//                    case "2":
//                        cell.moodEmoji.text = "😔"
//                    case "3":
//                        cell.moodEmoji.text = "😐"
//                    case "4":
//                        cell.moodEmoji.text = "🙂"
//                    case "5":
//                        cell.moodEmoji.text = "😄"
//                    default:
//                        cell.moodEmoji.text = ""
//                    }
//                    cell.dayOfMonth.setTitleColor(UIColor.blue, for: .normal)
//                }
//            }
            
            for entry in moodEntries {
//                let squareMood: Int? = Int(mood["dayOfMonth"] ?? 0)
                print("mood month: \(entry.month)")
                print("month label: \(String(describing: monthLabel.text!))")
                print("struct day type: \(type(of: entry.dayOfMonth))")
                print("totalSq num type: \(type(of: totalSquares[indexPath.item]))")
                print("squares: \(totalSquares[indexPath.item])")
                print("day: \(String(describing: entry.dayOfMonth))")

                print("struct month type: \(type(of: entry.month))")
                print("entry month: \(entry.month)")

                print("month label type: \(type(of: monthLabel.text!))")
                print("label: \(monthLabel.text!)")
                if entry.dayOfMonth == totalSquares[indexPath.item] && entry.month == monthLabel.text! {
//                    switch mood["mood"] {
//                    case "1":
//                        cell.moodEmoji.text = "😭"
//                    case "2":
//                        cell.moodEmoji.text = "😔"
//                    case "3":
//                        cell.moodEmoji.text = "😐"
//                    case "4":
//                        cell.moodEmoji.text = "🙂"
//                    case "5":
//                        cell.moodEmoji.text = "😄"
//                    default:
//                        cell.moodEmoji.text = ""
//                    }
                    cell.moodEmoji.text = entry.mood.stringEmoji
                    print("emoji: \(entry.mood.stringEmoji)")
//                    cell.dayOfMonth.setTitleColor(UIColor.blue, for: .normal)
                } else {
                    print("passed by the if statement")
                }
            }
        } else {
            cell.moodEmoji.text = ""
        }
        
//        print("number: \(totalSquares[indexPath.item])")
//        cell.isUserInteractionEnabled = true
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func findMoodEmoji() {
        var count: Int = 0
    }
    
//    private func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//            return CGSize(width: collectionView.bounds.size.width + 177, height: collectionView.bounds.size.height + 200)
//      }
    
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
    
    
    @IBAction func previousMonth(_ sender: Any) {
        selectedDate = CalendarHelper().minusMonth(date: selectedDate)
        setMonthView()
    }
    
    @IBAction func nextMonth(_ sender: Any) {
        selectedDate = CalendarHelper().plusMonth(date: selectedDate)
        setMonthView()
    }
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier
        {
        case Optional("toJournalView"):
            print("Going from first to journalView")
            let secondVC = segue.destination as!
            JournalViewController
            break;
        case Optional("toDayView"):
            print("Going from first to second")
            let dayVC = segue.destination as!
            DayViewController
            dayVC.message = "Howdy from First"
            dayVC.day = dayReview
            break;
        case Optional("toWeeklyView"):
            print("Going from first to second")
            let weeklyVC = segue.destination as!
            WeeklyViewController
            weeklyVC.day = dayReview
            print("day review vc: \(dayReview)")
            break;
        default:
            print("I have no idea what segue you're using")
        }
    }
    
    @IBAction func dayTouchUpInside(_ sender: UIButton) {
//        print("sender: \(String(describing: sender.titleLabel?.text))")
//        var setDay: String? = nil
        var dayValue: String?
        dayValue = sender.currentTitle
//        print("day type: \(type(of: dayValue))")
        print("day string: \(dayValue!)")
        
        let year = CalendarHelper().yearString(date: selectedDate)
        let month = CalendarHelper().monthString(date: selectedDate)
        dayReview = "\(String(describing: month)) \(String(describing: dayValue!)), \(year)"
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "MMMM d, yyyy"
        if let date = dateFormatterGet.date(from: dayReview) {
            print("date formatter: \(dateFormatterGet.string(from: date))")
            selectedDate = date
        } else {
            print("There was an error decoding")
        }
        
        
        dateReview = "\(String(describing: month)) \(String(describing: dayValue!)), \(year)"
        print("full day: \(dayReview)")
        print("full date: \(dateReview)")
        
        
        let alertController = UIAlertController(title: "uh oh...", message: "You don't have any activity on \(String(describing: dayReview))", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        dayEntry = [:]
        
//        for entry in moodHistory {
//            print("entry: \(entry)")
//            if entry["date"] == dayReview {
//                dayEntry = entry
//                print("matched date: \(String(describing: entry["date"]!))")
//            } else {
//                print("not matched: \(String(describing: entry["date"]!))")
//            }
//        }
        
        dateEntry = ""
        
        for entry in moodEntries {
            print("entry date: \(entry.monthDayYear)")
            print("day review: \(dateReview)")
            if entry.monthDayYear == dateReview {
//                dateEntry = entry.date
                dateEntry = entry.monthDayYear
                print("matched date: \(String(describing: dateEntry))")
            } else {
                print("not matched: \(entry.monthDayYear)")
            }
        }
//        if dayEntry == [:] {
////            dateEntry = ["date": dayReview, "mood": "0"]
//            alertController.addAction(OKAction)
//            self.present(alertController, animated: true, completion: nil)
//        }
        
        if dateEntry == "" {
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let initProgress = CalendarHelper().totalDayProgress(entries: moodEntries)
        numDayProgress.text = String(describing: initProgress)
        let doubleValue = Double(initProgress) / Double(7)
        let weeklyProgress = round(doubleValue * 10) / 10.0
        numWeeklyProgress.text = String(describing: weeklyProgress)
        collectionView.reloadData()
    }

}
