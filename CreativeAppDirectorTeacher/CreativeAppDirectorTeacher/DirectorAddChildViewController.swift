//
//  DirectorAddChildViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

class DirectorAddChildViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    
        //Labels
    @IBOutlet weak var labelSelectLevel: UILabel!
    @IBOutlet weak var labelChildCare: UILabel!
    
        //Buttons
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var btnChildCareIcon: UIButton!
    @IBOutlet weak var btnMealPlanIcon: UIButton!
    @IBOutlet weak var btnTransportIcon: UIButton!
    
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
//        let obj = self.storyboard?.instantiateViewController(withIdentifier: "DirectorAddChild2ViewController") as! DirectorAddChild2ViewController
//        
//        self.navigationController?.pushViewController(obj, animated: true)
    }
    
    //MARK: ViewLife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        
        //Icons
        btnChildCareIcon.setTitle("ma:child.care", for: .normal)
        btnChildCareIcon.parseIcon()
        btnMealPlanIcon.setTitle("ma:restaurant.menu", for: .normal)
        btnMealPlanIcon.parseIcon()
        btnTransportIcon.setTitle("ma:directions.bus", for: .normal)
        btnTransportIcon.parseIcon()

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initialization(){
        //Customization
        
        self.viewMasterContainer.layer.borderWidth = 0.4
        self.viewMasterContainer.layer.borderColor = UIColor.lightGray.cgColor
        
    }
}



























