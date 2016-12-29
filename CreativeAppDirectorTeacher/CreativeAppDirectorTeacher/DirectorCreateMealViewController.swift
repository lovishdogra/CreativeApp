//
//  DirectorCreateMealViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorCreateMealViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewCalenderContainer: UIView!
    @IBOutlet weak var viewRightContainer: UIView!
    
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
        
    }
}
