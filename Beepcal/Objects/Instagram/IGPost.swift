//
//  IGPost.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit
import SwiftInstagram

/**
 Object used to manage
 */
class IGPost: NSObject {

    /// Initialized InstagramMedia object used to store the properties of the authenticated user's post(s).
    var ig_media: InstagramMedia?
    
    // MARK: - Initialization
    init(mediaObject: InstagramMedia) {
        super.init()
        // Set the object.
        self.ig_media = mediaObject
    }
}
