//
//  ViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 26/11/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont


class ViewController: UIViewController {

    //MARK: Properties and IBOutlets
    @IBOutlet var imageViewSchool: UIImageView!
    @IBOutlet var textFieldEmail: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    @IBOutlet var btnLogin: UIButton!
    
    //MARK: View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initialization()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: IBActions of Buttons
    @IBAction func tapLogin(_ sender: UIButton) {
        
    }
    
    //MARK: Private Methods
    func initialization (){
    
        let labelEmail = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        labelEmail.textColor = UIColor.black
        labelEmail.font = UIFont.icon(from: .Ionicon, ofSize: 20.0)
        labelEmail.text = String.fontIonIcon("ios-person-outline")
        self.textFieldEmail.leftViewMode = UITextFieldViewMode.always
        self.textFieldEmail.leftView = labelEmail
        self.textFieldEmail.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        self.textFieldEmail.attributedPlaceholder = NSAttributedString(string: "Enter_Email".localized(lang: userDef.value(forKey: LANGUAGE) as! String), attributes: [NSForegroundColorAttributeName : UIColor.black])
        self.textFieldEmail.layer.cornerRadius = 3.0
        
        
        let labelPassword = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        labelPassword.textColor = UIColor.black
        labelPassword.font = UIFont.icon(from: .Ionicon, ofSize: 20.0)
        labelPassword.text = String.fontIonIcon("ios-locked-outline")
        self.textFieldPassword.leftViewMode = UITextFieldViewMode.always
        self.textFieldPassword.leftView = labelPassword
        self.textFieldPassword.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        self.textFieldPassword.attributedPlaceholder = NSAttributedString(string: "Enter_Password".localized(lang: userDef.value(forKey: LANGUAGE) as! String), attributes: [NSForegroundColorAttributeName : UIColor.black])
        self.textFieldPassword.layer.cornerRadius = 3.0
        self.textFieldPassword.isSecureTextEntry = true
        
        self.btnLogin.layer.cornerRadius = 3.0
    }

}

