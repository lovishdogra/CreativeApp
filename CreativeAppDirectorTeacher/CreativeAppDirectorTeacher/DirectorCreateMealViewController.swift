//
//  DirectorCreateMealViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import JTCalendar

class DirectorCreateMealViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
    
    
    var calendarManager = JTCalendarManager()
    var dateSelected = NSDate()
    
    //Views
    @IBOutlet weak var viewRightContainer: UIView!
    
    //Calendar View
    
    @IBOutlet weak var calendarMenuView: JTCalendarMenuView!
    @IBOutlet weak var calendarContentView: JTHorizontalCalendarView!
    
    
    //Labels
    @IBOutlet weak var labelEnter: UILabel!
    @IBOutlet weak var labelMainCourse: UILabel!
    @IBOutlet weak var labelDesserts: UILabel!
    
    //Buttons
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    //Text
    @IBOutlet weak var textFieldStarters: UITextField!
    @IBOutlet weak var textFieldMainCourse: UITextField!
    @IBOutlet weak var textFieldDesserts: UITextField!
    
    //MARK: IBActions
    @IBAction func tapCancel(_ sender: Any) {
        
    }
    
    @IBAction func tapSave(_ sender: Any) {
        
    }
    
    //MARK: ViewLifeMethods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initialization() {
        
        //Customization
        self.viewRightContainer.layer.borderWidth = 0.4
        self.viewRightContainer.layer.borderColor = UIColor.lightGray.cgColor
        
        //Calender
        self.calendarManager.delegate = self
        
        self.calendarMenuView.layer.borderWidth = 0.4
        self.calendarMenuView.layer.borderColor = UIColor.gray.cgColor
        self.calendarContentView.layer.borderWidth = 0.3
        self.calendarContentView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.calendarManager.menuView = calendarMenuView
        self.calendarManager.contentView = calendarContentView
        self.calendarManager.setDate(Date())
        self.calendarManager.dateHelper.calendar()
        self.calendarManager.reload()
    }
}

//MARK: Calendar Extension View

extension DirectorCreateMealViewController : JTCalendarDelegate {
    
    @nonobjc func calendar(_ calendar: JTCalendarManager!, prepareDayView dayView: JTCalendarDayView!) {
        
        dayView.isHidden = true
        
        if dayView.isFromAnotherMonth {
            
            dayView.isHidden = false
        }
            
        else if self.calendarManager.dateHelper.date(Date(), isEqualOrAfter: dayView.date) {
            
            dayView.circleView.isHidden = false
            dayView.circleView.backgroundColor = UIColor(red: 251.0/255.0, green: 13.0/255.0, blue: 81.0/255.0, alpha: 1.0)
            dayView.dotView.backgroundColor = UIColor.green
            dayView.textLabel.textColor = UIColor.blue
        }
            
            //        else if dateSelected && calendarManager.dateHelper.date(dateSelected, isTheSameDayThan: dayView.date){
            //
            //            dayView.circleView.isHidden = false
            //            dayView.circleView.backgroundColor = UIColor.red
            //            dayView.dotView.backgroundColor = UIColor.white
            //            dayView.textLabel!.textColor = UIColor.white
            //        }
            
        else {
            
            dayView.circleView.isHidden = true
            dayView.dotView.backgroundColor = UIColor.red
            dayView.textLabel!.textColor = UIColor.blue
        }
        
        //For Days having the events
//        if self.haveEvent(forDay: dayView.date!) {
//            
//            dayView.dotView.isHidden = false
//            
//        }
//        else {
//            
//            dayView.dotView.isHidden = true
//            
//        }
    
    }
    
    @nonobjc func calendar(_ calendar: JTCalendarManager!, didTouchDayView dayView: JTCalendarDayView!) {
        
        self.dateSelected = dayView.date as NSDate
        
        dayView.circleView.transform = CGAffineTransform.identity.scaledBy(x: 0.1, y: 0.1)
        UIView.transition(with: dayView, duration: 0.3, options: [], animations: {
            dayView.circleView.transform = CGAffineTransform.identity
            self.calendarManager.reload()
        }, completion: nil)
        
        if calendarManager.dateHelper.date(self.calendarContentView.date, isTheSameDayThan: dayView.date){
            
            if self.calendarContentView.date.compare(dayView.date) == ComparisonResult.orderedAscending {
                
                calendarContentView.loadNextPageWithAnimation()
            }
            else {
                
                calendarContentView.loadPreviousPageWithAnimation()
            }
        }
    }


}


















