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
    
    /**
     Update the cell's content with the CellState object. This method determines if the date is (1) part of this month, (2) a date of TODAY.
     - Parameter cellState: A CellState object.
     */
    func setCell(cellState: CellState) {
        // Date belongs to this month.
        if cellState.dateBelongsTo == .thisMonth {
            self.title.textColor = UIColor.black
            self.title.transform = CGAffineTransform.identity
            
            // Determine if date is today...
            // Check if today is today. If so, scale the date and make it 2X larger.
            if let nextDate = Calendar.current.date(byAdding: .day, value: 1, to: cellState.date) {
                if Date().isBetween(dateOne: cellState.date, dateTwo: nextDate) {
                    self.title.font = UIFont(name: "AvenirNext-Heavy", size: 17)
                    self.title.textColor = UIColor.babyBlue()
                }
            }
            
        } else if cellState.dateBelongsTo != .thisMonth {
        // Date DOESNOT belong to this month.
            self.title.textColor = UIColor.lightGray
            self.title.transform = CGAffineTransform.identity
        }
        
        // Set the date of the cell
        self.title.text = cellState.text
    }
    
    /**
     Updates the calendar cell's assetPreview with the contents of the post.
     - Parameter post: An InstagramMedia object. Used to set the cell's assetPreview with the image.
     */
    func updateView(post: InstagramMedia) {
        // MARK: - SDWebImage
        self.assetPreview.sd_setImage(with: post.images.thumbnail.url, placeholderImage: nil)
        // Re-design the title
        self.title.textColor = UIColor.white
    }
    
    // MARK: - View Life Cycle
    override func prepareForReuse() {
        super.prepareForReuse()
        // Re-set the title
        self.title.text = nil
        self.title.transform = CGAffineTransform.identity
        // MARK: - SDWebImage
        self.assetPreview.image = nil
        self.assetPreview.sd_cancelCurrentImageLoad()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Design the view objects
        // *** title
        title.font = UIFont(name: "AvenirNext-Bold", size: 12)
        title.textColor = UIColor.black
        title.textAlignment = .center
        title.backgroundColor = UIColor.clear
        
        // *** assetPreview
        assetPreview.contentMode = .scaleAspectFill
        assetPreview.roundCorners(withRadius: 8.00)
        assetPreview.backgroundColor = UIColor.clear
        assetPreview.clipsToBounds = true
        
        // *** containerView
        containerView.roundCorners(withRadius: 4.00)
        containerView.layer.applyShadow()
    }

}
