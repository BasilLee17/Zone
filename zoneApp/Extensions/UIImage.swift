//
//  UIImage.swift
//  zoneApp
//
//  Created by 🧊🧊 on 6/5/22.
//

import UIKit

enum ImageResources: String {
    case happy
    case good
    case meh
    case sad
    case cry
}

extension UIImage{
    convenience init(resource: ImageResources) {
        self.init(named: resource.rawValue)!
    }
}
