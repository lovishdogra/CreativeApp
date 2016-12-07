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
    @IBOutlet var labelForgotPassword: UIButton!
    @IBOutlet var viewScroll: UIScrollView!
    @IBOutlet var viewInner: UIView!
    var activeField : UITextField?
    
    @IBOutlet var viewBlackBackground: UIView!
    @IBOutlet var viewPopupForgot: UIView!
    @IBOutlet var viewPopupHeading: UIView!
    @IBOutlet var labelPopupHeading: UILabel!
    @IBOutlet var btnPopupClose: UIButton!
    @IBOutlet var textFieldPopupEmail: UITextField!
    @IBOutlet var btnPopupResetPassword: UIButton!
    

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
    
    @IBAction func tapForgotPassword(_ sender: Any) {
        viewBlackBackground.isHidden = false
        viewPopupForgot.isHidden = false
        viewPopupHeading.isHidden = false
        labelPopupHeading.isHidden = false
        btnPopupClose.isHidden = false
        textFieldPopupEmail.isHidden = false
        btnPopupResetPassword.isHidden = false
    }
    
    @IBAction func tapPopupClose(_ sender: Any) {
        viewBlackBackground.isHidden = true
        viewPopupForgot.isHidden = true
        viewPopupHeading.isHidden = true
        labelPopupHeading.isHidden = true
        btnPopupClose.isHidden = true
        textFieldPopupEmail.isHidden = true
        btnPopupResetPassword.isHidden = true
    }
    
    @IBAction func tapPopupResetPassword(_ sender: Any) {
        Utils.showToastMesaage(self.viewBlackBackground, message: "Check your email", delay: 2)
    }
    
    
    //MARK: Private Methods
    func initialization (){
        
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        //Keyboard Actions
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        registerForKeyboardNotifications()
        
        //Custom textfields
        let labelEmail = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        labelEmail.textColor = UIColor.black
        labelEmail.font = UIFont.icon(from: .Ionicon, ofSize: 20.0)
        labelEmail.text = String.fontIonIcon("ios-person-outline")
        self.textFieldEmail.leftViewMode = UITextFieldViewMode.always
        self.textFieldEmail.leftView = labelEmail
        self.textFieldEmail.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        self.textFieldEmail.attributedPlaceholder = NSAttributedString(string: "enter_email".localized(lang: userDef.value(forKey: LANGUAGE) as! String), attributes: [NSForegroundColorAttributeName : UIColor.black])
        self.textFieldEmail.layer.cornerRadius = 3.0
        
        let labelPassword = UILabel(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        labelPassword.textColor = UIColor.black
        labelPassword.font = UIFont.icon(from: .Ionicon, ofSize: 20.0)
        labelPassword.text = String.fontIonIcon("ios-locked-outline")
        self.textFieldPassword.leftViewMode = UITextFieldViewMode.always
        self.textFieldPassword.leftView = labelPassword
        self.textFieldPassword.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
        self.textFieldPassword.attributedPlaceholder = NSAttributedString(string: "enter_password".localized(lang: userDef.value(forKey: LANGUAGE) as! String), attributes: [NSForegroundColorAttributeName : UIColor.black])
        self.textFieldPassword.layer.cornerRadius = 5.0
        self.textFieldPassword.isSecureTextEntry = true
        
        self.btnLogin.layer.cornerRadius = 3.0
        
        //Language
        self.btnLogin.setTitle(Utils.returnLocalizedStringForKey(key: "btn_login"), for: .normal)
        self.labelForgotPassword.setTitle(Utils.returnLocalizedStringForKey(key: "label_forgot_password"), for: .normal)
        self.labelPopupHeading.text = Utils.returnLocalizedStringForKey(key: "label_pop_forgot_password")
        self.textFieldPopupEmail.attributedPlaceholder = NSAttributedString(string: Utils.returnLocalizedStringForKey(key: "popup_enter_email"))
        self.btnPopupResetPassword.setTitle(Utils.returnLocalizedStringForKey(key: "btn_reset_password"), for: .normal)
        
        //Colors
        viewInner.backgroundColor = colorBlue
        btnLogin.backgroundColor = colorOrange
        viewPopupForgot.backgroundColor = colorBackgroundGrey
        viewPopupHeading.backgroundColor = colorBlue
        btnPopupResetPassword.backgroundColor = colorOrange
        
        //Icons
        btnPopupClose.setTitle("io:close-circled", for: .normal)
        btnPopupClose.parseIcon()
        
        //Popup Visibility
        viewBlackBackground.isHidden = true
        viewPopupForgot.isHidden = true
        viewPopupHeading.isHidden = true
        labelPopupHeading.isHidden = true
        btnPopupClose.isHidden = true
        textFieldPopupEmail.isHidden = true
        btnPopupResetPassword.isHidden = true
    }
}


//MARK: Keyboard Actions
extension ViewController {
    //KeyBoard Dismissal Function
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.viewScroll.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        self.viewScroll.contentInset = contentInsets
        self.viewScroll.scrollIndicatorInsets = contentInsets
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.viewScroll.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification){
        //Once keyboard disappears, restore original positions
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.viewScroll.contentInset = contentInsets
        self.viewScroll.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.viewScroll.isScrollEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        activeField = nil
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
