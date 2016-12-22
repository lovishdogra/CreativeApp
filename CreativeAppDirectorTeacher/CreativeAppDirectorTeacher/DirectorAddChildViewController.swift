//
//  DirectorAddChildViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorAddChildViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    
        //Labels
    @IBOutlet weak var labelSelectLevel: UILabel!
    @IBOutlet weak var labelChildCare: UILabel!
    
        //Buttons
    @IBOutlet weak var btnNext: UIButton!
    
        //Images
    @IBOutlet weak var imageViewChild: UIImageView!
    
        //Text
    @IBOutlet weak var textFieldEnterName: UITextField!
    @IBOutlet weak var textFieldEnterDOB: UITextField!
    @IBOutlet weak var textFieldSplNotes: UITextField!
    @IBOutlet weak var textFieldChooseGender: UITextField!
    @IBOutlet weak var textFieldEnterCity: UITextField!
    @IBOutlet weak var textFieldChooseCountry: UITextField!
    @IBOutlet weak var textFieldChooseLevel: UITextField!
    @IBOutlet weak var textFieldChooseClass: UITextField!
    @IBOutlet weak var textFieldEnterChildCarePlan: UITextField!
    @IBOutlet weak var textFieldEnterMealPlan: UITextField!
    @IBOutlet weak var textFieldEnterTransportPlan: UITextField!
    
    //MARK: IBActions
    @IBAction func tapNext(_ sender: Any) {
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
        
    }
}
