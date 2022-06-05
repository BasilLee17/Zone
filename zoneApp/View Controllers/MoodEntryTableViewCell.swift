//
//  MoodEntryTableViewCell.swift
//  zoneApp
//
//  Created by 🧊🧊 on 6/5/22.
//

import UIKit

class MoodEntryTableViewCell: UITableViewCell {
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    @IBOutlet weak var labelMoodTitle: UILabel!
    @IBOutlet weak var labelMoodDate: UILabel!
    @IBOutlet weak var imageViewMood: UIImageView!
    
    func configure(_ entry: MoodEntry) {
        imageViewMood.backgroundColor = entry.mood.colorValue
        labelMoodTitle.text = entry.mood.stringValue
        labelMoodDate.text = entry.date.stringValue
    }

}
