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
var moodHistory = [["date": "June 6, 2022", "mood": "1"], ["date": "June 12, 2022", "mood": "5"], ["date": "June 12, 2022", "mood": "5"]]
var dateEntry: [String:String] = [:]

class HistoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    

    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
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
    }
    
    func setCellsView()
    {
        let width = (collectionView.frame.size.width - 2) / 8
        let height = (collectionView.frame.size.height - 2) / 8
        
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
        
        while(count <= 42)
        {
            if(count <= startingSpaces || count - startingSpaces > daysInMonth)
            {
                totalSquares.append("")
            }
            else
            {
                totalSquares.append(String(count - startingSpaces))
            }
            count += 1
        }
        
        monthLabel.text = CalendarHelper().monthString(date: selectedDate)
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
        
        cell.dayOfMonth.setTitle("\(totalSquares[indexPath.item])", for: .normal)
        
//        print("number: \(totalSquares[indexPath.item])")
        cell.isUserInteractionEnabled = true
        
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
        case Optional("fromFirstToSecond"):
            print("Going from first to second")
            let secondVC = segue.destination as!
            DayViewController
            secondVC.message = "Howdy from First"
            secondVC.day = ""
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
}
