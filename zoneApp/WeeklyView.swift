//
//  HistoryViewController.swift
//  zoneApp
//
//  Created by Isabelle Donsbach on 5/29/22.
//

import UIKit

class WeeklyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var totalSquares = [Date]()
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
    }
    
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 7
        let height = (collectionView.frame.size.height - 2) / 8
        
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.itemSize = CGSize(width: width, height: height)
    }
    
    func setWeekView()
    {
        totalSquares.removeAll()
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        let date = formatter.string(from: selectedDate)
        
        
        weekLabel.text = CalendarHelper().monthString(date: selectedDate)
            + " " + CalendarHelper().yearString(date: selectedDate)
        
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
        
        cell.dayOfMonth.setTitle(String(CalendarHelper().dayOfMonth(date: date)), for: .normal)
        cell.moodEmoji.text = "🫥"
        cell.dayOfMonth.setTitleColor(UIColor.red, for: .normal)
//        if totalSquares[indexPath.item] != "" {
////            let currentMonth = monthLabel.text
//            for mood in moodHistory {
////                let squareMood: Int? = Int(mood["dayOfMonth"] ?? 0)
////                print("mood month: \(mood["month"])")
////                print("month label: \(String(describing: monthLabel.text))")
//                if mood["dayOfMonth"]! == totalSquares[indexPath.item] && mood["month"] == weekLabel.text {
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
//        } else {
//            cell.moodEmoji.text = ""
//        }
        
//        print("number: \(totalSquares[indexPath.item])")
        cell.isUserInteractionEnabled = true
        cell.layoutIfNeeded()
        
        return cell
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
        print("day type: \(type(of: dayValue))")
        print("day string: \(dayValue!)")
        
        let year = CalendarHelper().yearString(date: selectedDate)
        let month = CalendarHelper().monthString(date: selectedDate)
        dayReview = "\(String(describing: month)) \(String(describing: dayValue!)), \(year)"
        print("full date: \(dayReview)")
        
        let alertController = UIAlertController(title: "uh oh...", message: "You don't have any activity on \(String(describing: dayReview))", preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default)
        
        for entry in moodHistory {
            print("entry: \(entry)")
            if entry["date"] == dayReview {
                dateEntry = entry
                print("matched date: \(String(describing: entry["date"]!))")
            }
        }
        if dateEntry == [:] {
//            dateEntry = ["date": dayReview, "mood": "0"]
            alertController.addAction(OKAction)
            self.present(alertController, animated: true, completion: nil)
            print("no match: \(String(describing: dayReview))")
        }
    }
    @IBAction func backPressed(_ sender: Any) {
        print("Dismiss was pressed")
        self.dismiss(animated: true)
    }
}
