//
//  BCNavigationBar.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit

/**
 NSObject class that manages the UINavigationBar's style for a view controller's navigation controller's UINavigationItem. This class is initialized with the following required properties...
 //
 - viewController: A UIViewController class this object applies to.
 - title: A String value that represents the view controller's navigation title.
 - color: A UIColor value that sets the navigation bar's item's tint color, as well as its title text color.
 - font: A UIFont value to set for the title.
 - isTranslucent: A Boolean value indicating whether the navigation bar is transparent or not.
 - delegate: An optional, UITextFieldDelegate associated with the UIViewController class. If the value is NULL, then the UITextField is NOT enabled.
 - leftItem: An optional, CSNavigationBarButton to set the left UIBarButtonItem for the navigation item.
 - rightItem: An optional, CSNavigationBarButton to set the right UIBarButtonItem for the navigation item.
 //
 */
class BCNavigationBar: NSObject {

    /// MARK: - Class Initialization.
    init(viewController: UIViewController, title: String, color: UIColor, font: UIFont, isTranslucent: Bool, delegate: UITextFieldDelegate?, leftItems: [BCNavigationBarButton]?, rightItems: [BCNavigationBarButton]?) {
        super.init()
        ///
        /// MARK: - UITextField
        ///
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 40.00))
        textField.borderStyle = .none
        textField.backgroundColor = UIColor.clear
        textField.tintColor = UIColor.babyBlue()
        textField.autocorrectionType = .default
        textField.clearButtonMode = .whileEditing
        textField.font = UIFont(name: "AvenirNext-Medium", size: 21)
        textField.textColor = color
        textField.clearButtonRect(forBounds: CGRect(x: 0, y: 0, width: 50, height: 50))
        textField.returnKeyType = .search
        textField.leftViewMode = .always
        // MARK: - UITextFieldDelegate. Attach the UITextFieldDelegate to the parent view controller class.
        if delegate != nil {
            // Create a UIImageView to add the search icon in the uitextfield
            let searchIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 20))
            searchIcon.contentMode = .scaleAspectFit
            searchIcon.image = UIImage(named: "Search")?.withRenderingMode(.alwaysTemplate)
            searchIcon.tintColor = color
            textField.leftViewMode = .always
            textField.leftView = searchIcon
            textField.addSubview(searchIcon)
            // Set the textField's delegate
            textField.delegate = delegate
        } else {
            // Otherwise, disable the UITextField
            textField.isUserInteractionEnabled = false
        }
        // Set the textField's placeHolder as an NSAttribtuedString to manipulate it's font and color
        textField.attributedPlaceholder = NSAttributedString.init(string: title, attributes: [NSAttributedStringKey.foregroundColor: color, NSAttributedStringKey.font: font])
        
        ///
        /// MARK: - CSNavigationBarButton
        //
        // *** leftItems
        if leftItems?.isEmpty == false {
            // Subtract the textField's width based on the number of buttons passed
            textField.frame.size.width -= CGFloat(leftItems!.count * 25)
            
            // Loop through the items, set its tintColor, and add it to the navigation view
            for leftButton in leftItems! {
                leftButton.tintColor = color
                viewController.navigationItem.setLeftBarButtonItems([UIBarButtonItem.init(customView: leftButton)], animated: true)
            }
        }
        // *** rightItems
        if rightItems?.isEmpty == false {
            // Subtract the textField's width based on the number of buttons passed
            textField.frame.size.width -= CGFloat(rightItems!.count * 25)
            
            // Loop through the items, set its tintColor, and add it to the navigation view
            for rightButton in rightItems! {
                rightButton.tintColor = color
                viewController.navigationItem.setRightBarButtonItems([UIBarButtonItem.init(customView: rightButton)], animated: true)
            }
        }
        
        // Set the translucency of the navigation bar
        if isTranslucent == true {
            // Set the status bar's style
            viewController.setStatusBarLight()
            // Make the navigation bar transparent
            viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            viewController.navigationController?.navigationBar.shadowImage = UIImage()
            viewController.navigationController?.navigationBar.backgroundColor = .clear
            viewController.navigationController?.navigationBar.isTranslucent = true
            // CALayer+Extensions
            viewController.navigationController?.navigationBar.layer.applyShadow()
        } else if isTranslucent == false {
            // Set the status bar's
            viewController.setStatusBarDefault()
            // Reset the navigation bar
            viewController.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            viewController.navigationController?.navigationBar.shadowImage = UIImage()
            viewController.navigationController?.navigationBar.isTranslucent = false
            // Add a light shadow to the navigation bar
            viewController.navigationController?.navigationBar.layer.masksToBounds = false
            viewController.navigationController?.navigationBar.layer.shadowColor = UIColor.groupTableViewBackground.cgColor
            viewController.navigationController?.navigationBar.layer.shadowOpacity = 0.8
            viewController.navigationController?.navigationBar.layer.shadowRadius = 2
            viewController.navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        }
        // Add the textField as the view controller's title view.
        viewController.navigationItem.titleView = textField
        // Show the navigation bar
        viewController.navigationController?.setNavigationBarHidden(false, animated: true)
    }


}
