//
//  UIViewController+Extensions.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit

extension UIViewController {
    
    /// Set the application's status bar to its light content (white).
    func setStatusBarLight() {
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .lightContent
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    /// Set the application's status bar to its default content (black).
    func setStatusBarDefault() {
        UIApplication.shared.isStatusBarHidden = false
        UIApplication.shared.statusBarStyle = .default
        self.setNeedsStatusBarAppearanceUpdate()
    }
}
