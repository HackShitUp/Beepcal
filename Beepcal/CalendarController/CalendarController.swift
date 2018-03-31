//
//  CalendarController.swift
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
 Abstract: UIViewController that works with JTAppleCalendar and SwiftInstagram to display whether the current user shared a post on a given date.
 */
class CalendarController: UIViewController {
    
    /// Declared DateFormatter object to configure the date of the calendar.
    let formatter = DateFormatter()
    /// MARK: - BCNavigationBar
    var bcNavigationBar: BCNavigationBar!
    
    // MARK: - SwiftInstagram
    /// Initialized array of InstagramMedia objects. Used to indicate which of the dates the user posted something.
    var allPosts = [InstagramMedia]()
    
    // MARK: - IBOutlets
    /// collection view adopting JTAppleCalendarView
    @IBOutlet weak var collectionView: JTAppleCalendarView!
    @IBOutlet weak var userProPic: UIImageView!
    @IBOutlet weak var monthTitle: UILabel!
    
    /// Function: Gets all the posts for the authenticated user.
    func getAllPostsForCurrentUser() {
        InstagramManager.shared.getAllMedia { (error: Error?, objects: [InstagramMedia]?) in
            if error == nil {
                print("fired!!!")
                
                // Clear array
                self.allPosts.removeAll(keepingCapacity: false)
                // Append the
                if objects?.isEmpty == false {
                    for post in objects! {
                        self.allPosts.append(post)
                    }
                    
//                    print("All posts: \(self.allPosts)\n\n\n")
                    
                    // Map the array of allPosts to their createdDates (Date).
                    let postedDates = self.allPosts.map({$0.createdDate})
                    // Reload the collection view at the dates posted.
                    self.collectionView!.reloadDates(postedDates)
                    self.collectionView!.reloadData()
                }
                
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // *** monthTitle
        monthTitle.font = UIFont(name: "AvenirNext-Heavy", size: 21.00)
        monthTitle.textColor = UIColor.black
        monthTitle.textAlignment = .left
        monthTitle.text = ""
        
        // MARK: - InstagramManager
        InstagramManager.shared.getCurrentUserData { (error: Error?, currentUser: InstagramUser?) in
            if error == nil {
                // Unwrap the user's profile photo's URL
                guard let proPicURL = currentUser?.profilePicture else {
                    return
                }
                // MARK: - SDWebImage
                self.userProPic.sd_setImage(with: proPicURL, completed: { (image, error, cacheType, url) in
                    if error == nil {
                        // Design the userProPic.
                        self.userProPic.makeCircular(borderWidth: 1.5, borderColor: UIColor.black)
                    }
                })
            } else {
                print(error?.localizedDescription as Any)
            }
        }
        
        // Get all the posts by the current user
        self.getAllPostsForCurrentUser()

        // MARK: - BCUIManager
        BCUIManager.shared.showStatusBarBanner(title: "Scroll Left & Right!", color: UIColor.charcoal())
        
        // MARK: - BCNavigationBar
        self.bcNavigationBar = BCNavigationBar.init(viewController: self, title: "Calendar", color: UIColor.black, font: UIFont(name: "AvenirNext-Bold", size: 21)!, isTranslucent: false, delegate: nil, leftItems: nil, rightItems: nil)
        
        // MARK: - JTAppleCalendarView
        self.collectionView.scrollDirection = .horizontal
        self.collectionView.minimumLineSpacing = 0.0
        self.collectionView.minimumInteritemSpacing = 0.0
        self.collectionView.calendarDataSource = self
        self.collectionView.calendarDelegate = self

        // Register cell classes
        self.collectionView.register(UINib(nibName: "CalendarCell", bundle: nil), forCellWithReuseIdentifier: "CalendarCell")
        
        // Setup the calendar's visible month
        self.collectionView.visibleDates {[unowned self] (visibleDates: DateSegmentInfo) in
            self.setupViewsOfCalendar(from: visibleDates)
        }
        
        // Scroll to current date
        self.collectionView.scrollToDate(Date())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // TODO::
        // remove reloadable data.
    }
    
    
    /**
     Display the visible dates for in the calendar
     */
    func setupViewsOfCalendar(from visibleDates: DateSegmentInfo) {
        guard let startDate = visibleDates.monthDates.first?.date else {
            return
        }
        let month = Calendar.current.dateComponents([.month], from: startDate).month!
        let monthName = DateFormatter().monthSymbols[(month-1) % 12]
        monthTitle.text = monthName + " " + String(Calendar.current.component(.year, from: startDate))
    }
}


// MARK: - CalendarController JTAppleCalendarExtension
extension CalendarController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    // MARK: - JTAppleCalendarViewDatasource
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        // Set up the date formatter w its correct time-zone
        formatter.dateFormat = "yyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        // Set up the start and end dates for the calendar
        let startDate = formatter.date(from: "2018 01 01")
        let endDate = formatter.date(from: "2019 01 01")
        
        // Return the calendar's attributes w the configured data sets
        return ConfigurationParameters.init(startDate: startDate!, endDate: endDate!)
    }
    
    
    // MARK: - JTAppleCalendarViewDelegate
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        // *** CalendarCell
        let calendarCell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        calendarCell.title.text = cellState.text
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        // *** CalendarCell
        let calendarCell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        
        // Indicate with color value changes that a new month started
        if cellState.dateBelongsTo == .thisMonth {
            calendarCell.title.textColor = UIColor.black
            calendarCell.title.transform = CGAffineTransform.identity
            if Date() == cellState.date {
                calendarCell.title.textColor = UIColor.infared()
                calendarCell.title.transform = CGAffineTransform(scaleX: 1.50, y: 1.50)
            }
        } else {
            calendarCell.title.textColor = UIColor.lightGray
            calendarCell.title.transform = CGAffineTransform.identity
        }
        // Set the date of the cell
        calendarCell.title.text = cellState.text
        
        
        // Update thge CalendarCell class with the first post the user shared on that date.
        /// Filtered array of InstagramMedia objects based on whether the posts's dates match that of this cell's date.
        let postsForThisDate = self.allPosts.map({$0.createdDate})
        // Determine if any of the posts were posted in this cell's date.
        if postsForThisDate.contains(cellState.date) {
            calendarCell.title.text = "!"
        }
        

        // Return the calendarCell
        return calendarCell
    }

    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        setupViewsOfCalendar(from: visibleDates)
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        // TODO::
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didDeselectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        // TODO::
    }
    
}
