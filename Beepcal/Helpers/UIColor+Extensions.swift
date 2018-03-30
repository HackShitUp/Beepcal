//
//  UIColor+Extensions.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit

/**
 UIColor extension class.
 */
extension UIColor {
    
    /// Function: Returns a custom color, "tintBlue"
    static func tintBlue() -> UIColor {
        // Tint Blue
        // UIColor(red: 0, green: 0.63, blue: 1, alpha: 1)
        // #1B26FF
        return UIColor(red: 0.11, green: 0.15, blue: 1.00, alpha: 1.0)
    }
    
    /// Function: Returns a custom color, "babyBlue"
    static func babyBlue() -> UIColor {
        // Baby Blue
        // UIColor(red:0.00, green:0.48, blue:1.00, alpha:1.0)
        // #007AFF
        return UIColor(red: 0.00, green: 0.48, blue: 1.00, alpha: 1.0)
    }
    
    /// Function: Returns a custom color, "navyBlue"
    static func navyBlue() -> UIColor {
        // Navy Blue
        // UIColor(red: 0.00, green: 0.41, blue: 0.64, alpha: 1.0)
        // #0068A3
        return UIColor(red: 0.00, green: 0.41, blue: 0.64, alpha: 1.0)
    }
    
    /// Function: Returns a custom color, "hotBrick"
    static func hotBrick() -> UIColor {
        // Hot Brick
        // UIColor(red: 1, green: 0, blue: 0.31, alpha: 1)
        // #FF0050
        return UIColor(red: 1, green: 0, blue: 0.31, alpha: 1)
    }
    
    /// Function: Returns a custom color, "infared"
    static func infared() -> UIColor {
        // Infared
        // UIColor(red: 1, green: 0, blue: 0.26, alpha: 1)
        // #FF0042
        return UIColor(red: 1, green: 0, blue: 0.26, alpha: 1)
    }
    
    /// Function: Returns a custom color, "royalPurple"
    static func royalPurple() -> UIColor {
        // Royal Purple
        // UIColor(red: 0.74, green: 0.06, blue: 0.88, alpha: 1)
        // #BD0FE1
        return UIColor(red: 0.74, green: 0.06, blue: 0.88, alpha: 1)
    }
    
    /// Function: Returns a custom color, "kidYellow"
    static func kidYellow() -> UIColor {
        // Yellow
        // UIColor(red: 1, green: 1, blue: 0, alpha: 1)
        // # FFFF00
        return UIColor(red: 1, green: 1, blue: 0, alpha: 1)
    }
    
    /// Function: Returns the static color, "charcoal"
    static func charcoal() -> UIColor {
        // Charcoal
        // UIColor(red:0.15, green:0.15, blue:0.15, alpha:1.0)
        // #272727
        return UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0)
    }
    
    /// Function: Returns the static color, "staticGray"
    static func staticGray() -> UIColor {
        // Gray
        // UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        // #d8d8d8
        return UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
    }
    
    /// Function: Returns the static color, "iceGray"
    static func iceGray() -> UIColor {
        // Super Light Gray
        // #f7f7f7
        // UIColor(red: 0.97, green: 0.97, blue: 0.99, alpha: 1)
        return UIColor(red: 0.97, green: 0.97, blue: 0.99, alpha: 1)
    }
    
    /// Function: Returns the static color, "natureGreen"
    static func natureGreen() -> UIColor {
        // Nature Green
        // UIColor(red: 0.15, green: 0.64, blue: 0.00, alpha: 1.0)
        // # 27A300
        return UIColor(red: 0.15, green: 0.64, blue: 0.00, alpha: 1.0)
    }
    
    /// Function: Generates a random UIColor
    static func randomColor() -> UIColor {
        return UIColor(red: CGFloat(arc4random()) / CGFloat(UInt32.max),
                       green: CGFloat(arc4random()) / CGFloat(UInt32.max),
                       blue:  CGFloat(arc4random()) / CGFloat(UInt32.max),
                       alpha: 1)
    }
    
    /// Function: Gets a random color from a pre-set configuration of colors in an array.
    static func getRandomColor() -> UIColor {
        let colors = [
            // kidYellow
            UIColor(red: 1, green: 1, blue: 0, alpha: 1),
            // royalPurple
            UIColor(red: 0.74, green: 0.06, blue: 0.88, alpha: 1),
            // babyBlue
            UIColor(red: 0.00, green: 0.58, blue: 0.92, alpha: 1.0),
            // infared
            UIColor(red: 1, green: 0, blue: 0.26, alpha: 1),
            // natureGreen
            UIColor(red: 0.15, green: 0.64, blue: 0.00, alpha: 1.0)
        ]
        // Get a random index within the array
        let randomIndex = Int(arc4random_uniform(UInt32(colors.count)))
        // Return a random color
        return colors[randomIndex]
    }
    
    /// Function: Used to utilize HEX Color values instead of UIColor's RGB components:
    /// USAGE: let color2 = UIColor(rgb: ff0050)
    /// - Parameter red: The red HEX color value.
    /// - Parameter green: The green HEX color value.
    /// - Parameter blue: The blue HEX color value.
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    
    /// USAGE: let color2 = UIColor(rgb: ff0050)
    /// - Parameter rgb: The HEX color value; IE: #ff0050
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }

    
}
