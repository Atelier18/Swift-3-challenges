//
//  Fonts.swift
//  Swift3-003-Custom Font
//
//  Created by Tomsqualm on 2017-04-16.
//  Copyright © 2017 Atelier18. All rights reserved.
//
import UIKit

enum FontBook: String {
    case Regular = "Bitter"
    case HeavyItalic = "Avenir-Heavy"
    
    func of(size: CGFloat) -> UIFont? {
        return UIFont(name: self.rawValue, size: size)
    }
}
