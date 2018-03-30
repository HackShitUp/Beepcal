
//
//  CALayer+Extensions.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit

extension CALayer {
    /**
     Applies a shadow to a view's CALayer.
     */
    func applyShadow() {
        self.shadowColor = UIColor.black.cgColor
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.shadowRadius = 3
        self.shadowOpacity = 0.5
    }
}
