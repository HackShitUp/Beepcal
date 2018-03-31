//
//  CalendarCell.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit
import JTAppleCalendar
import SwiftInstagram
import SDWebImage

/**
 UICollectionViewCell that adopts the JTAppleCalendar.
 */
class CalendarCell: JTAppleCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var assetPreview: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
    
    
    func updateView(post: InstagramMedia) {
        print("Post is: \(post)\n\n\n")
    }
    
    
    // MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        // Design the view objects
        // *** title
        title.font = UIFont(name: "AvenirNext-Bold", size: 12)
        title.textColor = UIColor.black
        title.textAlignment = .center
        
        // *** assetPreview
        assetPreview.roundCorners(withRadius: 2.00)
        assetPreview.contentMode = .scaleAspectFill
        
        // *** containerView
        containerView.roundCorners(withRadius: 4.00)
        containerView.layer.applyShadow()
    }

}
