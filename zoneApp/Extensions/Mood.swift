//
//  Mood.swift
//  zoneApp
//
//  Created by 🧊🧊 on 6/4/22.
//

import Foundation
import UIKit

struct Mood {
    var name  : String
    var image : UIImage
    var color : UIColor
}

extension Mood {
    static let happy = Mood(name: "happy", image: UIImage(resource: .happy), color: UIColor.happy)
    static let good = Mood(name: "good", image: UIImage(resource: .good), color: UIColor.good)
    static let meh = Mood(name: "meh",
                             image: UIImage(resource: .meh),
                             color: UIColor.meh)
    
    static let sad = Mood(name: "sad",
                            image: UIImage(resource: .sad),
                            color: UIColor.sad)
    
    static let cry = Mood(name: "cry",
                            image: UIImage(resource: .cry),
                            color: UIColor.cry)
}

