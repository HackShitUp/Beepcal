


//
//  Date+Extensions.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit

extension Date {
    /// Function: Determine if 2 Date objects fall between the given Date.
    /// - Parameter dateOne: The starting Date object.
    /// - Parameter dateTwo: The ending Date object.
    func isBetween(dateOne: Date, dateTwo: Date) -> Bool {
        return dateOne.compare(self).rawValue * self.compare(dateTwo).rawValue >= 0
    }
}
