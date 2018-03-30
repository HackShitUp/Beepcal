//
//  CalendarController.swift
//  Beepcal
//
//  Created by Joshua Choi on 3/30/18.
//  Copyright © 2018 Capsule LLC. All rights reserved.
//

import UIKit
import JTAppleCalendar

/**
 
 */
class CalendarController: UIViewController, JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    
    let formatter = DateFormatter()
    
    
    // MARK: - BCNavigationBar
    var bcNavigationBar: BCNavigationBar!

    // MARK: - IBOutlets
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - BCNavigationBar
        self.bcNavigationBar = BCNavigationBar.init(viewController: self, title: "Calendar", color: UIColor.black, font: UIFont(name: "AvenirNext-Bold", size: 21)!, isTranslucent: false, delegate: nil, leftItems: nil, rightItems: nil)
        
        // Register cell classes
        collectionView.register(UINib(nibName: "CalendarCell", bundle: Bundle.main), forCellWithReuseIdentifier: "CalendarCell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    // MARK: - JTAppleCalendarViewDatasource
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale = Calendar.current.locale
        
        let startDate = formatter.date(from: "2018 01 01")
        let endDate = formatter.date(from: "2019 01 01")
        
        let parameters = ConfigurationParameters.init(startDate: startDate!, endDate: endDate!)
        return parameters
    }
    
    
    // MARK: - JTAppleCalendarViewDelegate
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        print("will display!")
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        // *** CalendarCell
        let calendarCell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CalendarCell", for: indexPath) as! CalendarCell
        calendarCell.contentView.backgroundColor = UIColor.red
        return calendarCell
    }


}
