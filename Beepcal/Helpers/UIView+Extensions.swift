//
//  UIView+Extensions.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit

extension UIView {
    /// Function: - Returns a copy of a UIView object (frame included).
    /// - Usage: let copiedView = UIView().copiedView()
    func copiedView() -> UIView? {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as? UIView
    }
    
    /// Function: Round all corners of UIView
    /// - Parameter withRadius: Rounds the corners of a UIView with the passed corner radius.
    func roundCorners(withRadius: CGFloat) {
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsLayout()
        self.layer.cornerRadius = withRadius
        self.clipsToBounds = true
    }
    
    
    /// Function: Rounds ONLY the sides of a UIView. Should use when the sides of a long UIButton (width > height) should be rounded.
    /// - Parameter borderWidth: CGFloat value to define width of the border.
    /// - Parameter borderColor: UIColor value to define color of the border.
    func roundSides(borderWidth: CGFloat?, borderColor: UIColor?) {
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsLayout()
        self.layer.borderColor = borderColor!.cgColor
        self.layer.borderWidth = borderWidth!
        self.layer.cornerRadius = self.frame.height/2
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

    /// Function: Draws a circular mask around a UIView object
    /// - Parameter forView: The UIView object to draw a circular mask around its layer for.
    /// - Parameter borderWidth: The width of the outer border of the UIView's layer.
    /// - Parameter color: The UIColor of the border.
    func makeCircular(borderWidth: CGFloat?, borderColor: UIColor?) {
        self.layoutIfNeeded()
        self.layoutSubviews()
        self.setNeedsLayout()
        self.layer.cornerRadius = self.frame.size.width/2
        self.layer.borderColor = borderColor!.cgColor
        self.layer.borderWidth = borderWidth!
        self.layer.masksToBounds = true
        self.clipsToBounds = true
    }

}
