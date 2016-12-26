//
//  DirectorAddChild2ViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 22/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorAddChild2ViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewLeftContainer: UIView!
    @IBOutlet weak var viewRightContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
        //Labels
    @IBOutlet weak var labelAddGaurdian: UILabel!
    
        //Buttons
    @IBOutlet weak var btnBack: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var btnCancelGaurdian: UIButton!
    @IBOutlet weak var btnSaveGaurdian: UIButton!
    
        //Text
    @IBOutlet weak var textFieldEnterNamer: UITextField!
    @IBOutlet weak var textFieldEnterDOB: UITextField!
    @IBOutlet weak var textFieldEnterCity: UITextField!
    @IBOutlet weak var textFieldEnterChildCarePlan: UITextField!
    @IBOutlet weak var textFieldEnterMealPlan: UITextField!
    @IBOutlet weak var textFieldEnterTransportPlan: UITextField!
    @IBOutlet weak var textFieldEnterNameGaurdian: UITextField!
    @IBOutlet weak var textFieldEnterNumGaurdian: UITextField!
    @IBOutlet weak var textFieldEnterEmailGaurdian: UITextField!
    @IBOutlet weak var textFieldChooseParentingType: UITextField!
    
        //Images
    @IBOutlet weak var imageViewChild: UIImageView!
    @IBOutlet weak var imageViewChildCareIcon: UIImageView!
    @IBOutlet weak var imageViewMealIcon: UIImageView!
    @IBOutlet weak var imageViewTransportIcon: UIImageView!
    @IBOutlet weak var imageViewGuardian: UIImageView!
    
    //MARK: IBActions
    @IBAction func tapBack(_ sender: Any) {
        
        //self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func tapSave(_ sender: Any) {
    }
    @IBAction func tapCancelGaurdian(_ sender: Any) {
    }
    @IBAction func tapSaveGuardian(_ sender: Any) {
    }
    
    
    //MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initialization(){
        
    }
}
