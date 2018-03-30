//
//  BCNavigationBarButton.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit

/// MARK: - BCNavigationBarButtonType
/**
 Enumeration reference used to design the properties of the UIButton, along with its delegate calls. Cases include...
 • .back = Set the UIButton's image to a back-arrow.
 • .exit = Set the UIButton's image to an "X".
 • .refresh = Set the UIButton's image to a circular arrow.
 • .profilePhoto = Set the user's profile photo.
 */
@objc enum BCNavigationBarButtonType: Int {
    case add
    case back
    case delete
    case exit
    case refresh
    case profilePhoto
}


/// MARK: - BCNavigationBarButtonDelegate
@objc protocol BCNavigationBarButtonDelegate: class {
    /**
     Optional method used for high-level call backs when the BCNavigationBarButton was tapped.
     - Parameter type: A BCNavigationBarButtonType enum instance. Once this method is called in the class confirming to this protocol, its type should be managed during its call back to delegate any further methods.
     */
    @objc optional func navigationBarButtonCall(type: BCNavigationBarButtonType)
}

/**
 UIButton class adoption used to work in conjunction with the BCNavigationBar class. This class is initialized with the following parameters:
 - type: A BCNavigationBarButtonType enum instance.
 - delegate: A BCNavigationBarButtonDelegate protocol reference.
 */
class BCNavigationBarButton: UIButton {
    
    /// Initialized BCNavigationBarButtonType.
    var barButtonType: BCNavigationBarButtonType!
    /// Initialized BCNavigationBarButtonDelegate.
    var barButtonDelegate: BCNavigationBarButtonDelegate!
    
    /**
     Class function that's implemented as its target method during initialization.
     - Parameter sender: Any object instance.
     */
    @objc func buttonTapped(_ sender: Any) {
        // MARK: - BCNavigationBarButtonDelegate
        self.barButtonDelegate.navigationBarButtonCall!(type: self.barButtonType)
    }
    
    // MARK: - Class Initialization
    /// - Parameter type: BCNavigationBarButtonType
    /// - Parameter delegate: BCNavigationBarButtonDelegate
    init(type: BCNavigationBarButtonType, delegate: BCNavigationBarButtonDelegate) {
        super.init(frame: CGRect(x: 0, y: 0, width: 25, height: 25))
        // Set this class' button type
        barButtonType = type
        // Set this button's delegate
        barButtonDelegate = delegate
        
        // Set the background color
        backgroundColor = UIColor.clear
        
        switch type {
        case .add:
            // *** Add
            let addImage = UIImage(named: "Plus")!.withRenderingMode(.alwaysTemplate)
            self.setImage(addImage, for: .normal)
        case .delete:
            // *** Delete
            let deleteImage = UIImage(named: "Delete_50")!.withRenderingMode(.alwaysTemplate)
            self.setImage(deleteImage, for: .normal)
        case .back:
            // *** Back
            let backImage = UIImage(named: "Left_50")!.withRenderingMode(.alwaysTemplate)
            self.setImage(backImage, for: .normal)
        case .exit:
            // *** Exit
            let exitImage = UIImage(named: "Exit")!.withRenderingMode(.alwaysTemplate)
            self.setImage(exitImage, for: .normal)
        case .refresh:
            // *** Refresh
            let refreshImage = UIImage(named: "Refresh")!.withRenderingMode(.alwaysTemplate)
            self.setImage(refreshImage, for: .normal)
        case .profilePhoto:
            // *** Profile Photo
            print("Profile Photo")
        }
        
        // Attach the delegate method to this UIButton object
        self.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

