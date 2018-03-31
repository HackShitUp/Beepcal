//
//  BCUIManager.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit
import NotificationBannerSwift

/**
 Abstract: Displays banners to help with UX feedback.
 */
class BCUIManager: NSObject {
    
    /// Class re-declaration for globl instance manager
    static let shared = BCUIManager()
    
    /// MARK: - NotificationBannerSwift. Used to show StatusBarNotificationBanner with its given title and custom color.
    /// - Parameter withTitle: Non-optional String value used to set the banner's title.
    /// - Parameter color: Non-optional UIColor value used to set the banner's background color. The title of the banner is fixed to white.
    func showStatusBarBanner(title: String, color: UIColor) {
        let banner = StatusBarNotificationBanner(title: title, style: .success)
        banner.titleLabel?.font = UIFont(name: "AvenirNext-Demibold", size: 12)
        banner.backgroundColor = color
        banner.duration = 0.20
        banner.show()
    }
}
