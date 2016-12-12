//
//  DirectorCreateMenuViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import CVCalendar

class DirectorCreateMenuViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
    @IBOutlet weak var viewCVCalender: CVCalendarView!
    var selectedDay: DayView!
    var currentCalender: Calendar?
    
    //MARK: View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initializers()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewCVCalender.commitCalendarViewUpdate()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initializers() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        currentCalender = Calendar.init(identifier: .gregorian)
    }
}
