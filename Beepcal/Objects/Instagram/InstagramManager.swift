//
//  InstagramManager.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit
import SwiftInstagram

/**
 Abstract: NSObject that manages POST/GET requests using the Instagram API with Alomafire/AFNetworking (one of these REST api's are pre-packed with the SwiftInstagram API). Heavy on queries.
 */
class InstagramManager: NSObject {

    /// Declared global instance.
    static let shared = InstagramManager()

    /**
     Function: Gets the current user's data
     - Parameter error: An optional, Error object if the query failed.
     - Parameter object: An optional, InstagramUser object representing the authenticated user.
     */
    open func getCurrentUserData(completionHandler: @escaping (_ error: Error?, _ object: InstagramUser?) ->()) {
        // MARK: - SwiftInstagram
        Instagram.shared.user("self", success: { (user: InstagramUser) in
            completionHandler(nil, user)
        }) { (error: Error?) in
            print("\(self): \(error?.localizedDescription as Any)")
            completionHandler(error, nil)
        }
    }
    
    /**
     Function: Gets the current user's data
     - Parameter error: An optional, Error object if the query failed.
     - Parameter objects: An optional, array of InstagramMedia objects representing the authenticated user.
     */
    open func getAllMedia(completionHandler: @escaping (_ error: Error?, _ objects: [InstagramMedia]?) ->()) {
        // MARK: - SwiftInstagram
        Instagram.shared.recentMedia(fromUser: "self", success: { (recentMedia: [InstagramMedia]) in
            // Pass the values in the completionHandler
            completionHandler(nil, recentMedia)
        
        }) { (error: Error?) in
            print("\(self): \(error?.localizedDescription as Any)")
            // Pass the values in the completionHandler
            completionHandler(error, nil)
        }
    }
    
}
