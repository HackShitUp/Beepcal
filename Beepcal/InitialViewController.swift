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
        
        let api = Instagram.shared
        
        // Unwrap the navigation controller
        if let navigator = self.navigationController {
            // MARK: - SwiftInstagram
            api.login(from: navigator, success: {
                print("Success")
                
            }, failure: { (error: Error?) in
                print("\(self): \(error?.localizedDescription as Any)")
            })
        }
    }
    
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the navigationBar
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        print("User is authenticated: \(Instagram.shared.isAuthenticated)")
        
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
