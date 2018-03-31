//
//  InitialViewController.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit
import SwiftInstagram

/**
 Initial view controller for project. Used to authenticate a user using the SwiftInstagram API. ClientID is located in project's Info.plist.
 */
class InitialViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func loginAction(_ sender: Any) {
        // Unwrap the navigation controller
        if let navigator = self.navigationController {
            // MARK: - SwiftInstagram
            Instagram.shared.login(from: navigator, success: {
                // Ensure that the user is authenticated before displaying their posts in the calendar.
                if Instagram.shared.isAuthenticated == true {
                    // MARK: - BCUIManager
                    BCUIManager.shared.showStatusBarBanner(title: "Authenticated!", color: UIColor.babyBlue())
                    
                    // CalendarController
                    let calendarControllerVC = self.storyboard?.instantiateViewController(withIdentifier: "calendarControllerVC") as! CalendarController
                    self.navigationController?.pushViewController(calendarControllerVC, animated: true)
                }
            }, failure: { (error: Error?) in
                print("\(self): \(error?.localizedDescription as Any)")
                // MARK: - BCUIManager
                BCUIManager.shared.showStatusBarBanner(title: "Couldn't Log In...", color: UIColor.infared())
            })
        }
    }
    
    
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - BCNavigationBar
        _ = BCNavigationBar(viewController: self, title: "Beepcal", color: UIColor.babyBlue(), font: UIFont(name: "AvenirNext-Bold", size: 21)!, isTranslucent: false, delegate: nil, leftItems: nil, rightItems: nil)
        
        
        // MARK: - SwiftInstagram
        // Show the calendar if the user is already authenticated
        if Instagram.shared.isAuthenticated == true {
            // MARK: - BCUIManager
            BCUIManager.shared.showStatusBarBanner(title: "Already Authenticated!", color: UIColor.babyBlue())
            // CalendarController
            let calendarControllerVC = self.storyboard?.instantiateViewController(withIdentifier: "calendarControllerVC") as! CalendarController
            self.navigationController?.pushViewController(calendarControllerVC, animated: true)
        }
        
        // Design the loginButton
        loginButton.backgroundColor = UIColor.babyBlue()
        loginButton.roundSides(borderWidth: 0.0, borderColor: UIColor.clear)
        loginButton.layer.applyShadow()
        loginButton.setTitle("Log In to Instagram", for: .normal)
        loginButton.titleLabel!.font = UIFont(name: "AvenirNext-Bold", size: 15)
        loginButton.setTitleColor(UIColor.white, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // TODO::
        // Clear reload-able cache.
    }

}
