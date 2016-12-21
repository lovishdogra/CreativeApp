//
//  TeacherCreateEventViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherCreateEventViewController: UIViewController {
    
    //MARK:Declarations & IBOutlets
    
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewScrollContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
        //Labels
    @IBOutlet weak var lableSelectedKids: UILabel!
    @IBOutlet weak var labelEventDescription: UILabel!
    @IBOutlet weak var labelStart: UILabel!
    @IBOutlet weak var lableEnd: UILabel!
    @IBOutlet weak var labelRemainder: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelComingEvent: UILabel!
    
        //Buttons
    @IBOutlet weak var btnSelectedKids: UIButton!
    @IBOutlet weak var btnIC: UIButton!
    @IBOutlet weak var btnAddEntry: UIButton!
    
        //Texts
    @IBOutlet weak var textFieldEventTitle: UITextField!
    @IBOutlet weak var textViewEventDescription: UITextView!
    @IBOutlet weak var textFieldStartDate: UITextField!
    @IBOutlet weak var textFieldEndDate: UITextField!
    @IBOutlet weak var textFieldReminder: UITextField!
    @IBOutlet weak var textFieldPrice: UITextField!
    
    //MARK:IBActions
    
    @IBAction func tapSelectedKids(_ sender: Any) {
    }
    @IBAction func tapIC(_ sender: Any) {
    }
    @IBAction func tapAddEntry(_ sender: Any) {
    }
    
    //MARK:ViewLife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initialization(){
        
    }
}
