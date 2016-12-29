//
//  DirectorCreateEventViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorCreateEventViewController: UIViewController {
    
    //MARK: Declarations & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewInnerScrollContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    @IBOutlet weak var labelClass: UILabel!
    @IBOutlet weak var labelEventDescription: UILabel!
    @IBOutlet weak var labelStart: UILabel!
    @IBOutlet weak var labelEnd: UILabel!
    @IBOutlet weak var labelReminder: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelComingEvent: UILabel!
    
    
        //Buttons
    @IBOutlet weak var btnIcon: UIButton!
    @IBOutlet weak var btnAddEntry: UIButton!
    
    
        //Texts
    
    @IBOutlet weak var textFieldEventTitle: UITextField!
    @IBOutlet weak var textViewEventDescription: UITextView!
    @IBOutlet weak var textFieldStartDate: UITextField!
    @IBOutlet weak var textFieldEndDate: UITextField!
    @IBOutlet weak var textFieldReminder: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    
    //MARK: IBActions
    
    @IBAction func tapIcon(_ sender: Any) {
    }
    @IBAction func tapAddEntry(_ sender: Any) {
    }
    
    
    //MARK: ViewLife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initialization(){
        //Customization
        viewTopbarContainer.clipsToBounds = true
    }
}
