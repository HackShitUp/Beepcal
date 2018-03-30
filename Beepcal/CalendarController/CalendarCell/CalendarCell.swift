//
//  CalendarCell.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit
import JTAppleCalendar

/**
 UICollectionViewCell that adopts the JTAppleCalendar.
 */
class CalendarCell: JTAppleCell {
    
    // MARK: - IBOutlets
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var assetPreview: UIImageView!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
