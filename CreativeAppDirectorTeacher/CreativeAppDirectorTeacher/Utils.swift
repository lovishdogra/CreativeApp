//
//  Utils.swift
//  VideoChat
//
//  Created by Rohit Singh on 09/12/15.
//  Copyright © 2015 Home. All rights reserved.
//

import UIKit
import MBProgressHUD


class Utils: NSObject {
    
    static var hud : MBProgressHUD? = nil
    
    //MARK: Start Activity Indicator
    class func startActivityIndicator(_ title:String?,detailMessage : String?, onView: UIView){
        self.hud =  MBProgressHUD.showAdded(to: onView, animated: true)
        self.hud!.mode = MBProgressHUDMode.indeterminate
        if let unwarpTitle = title {
            self.hud!.label.text = unwarpTitle
        }
        if let unwarpDetailsMessage = detailMessage {
            self.hud!.detailsLabel.text = unwarpDetailsMessage
        }
        //  print("hud\(hud)")
        self.hud!.show(animated: true)
    }
    
    //MARK: Stop Activity Indicator
    class func stopActivityIndicator(){
        DispatchQueue.main.async(execute: { () -> Void in
            if let unwrapHud = self.hud {
                unwrapHud.isHidden = true
            } else {
                print("MBProgressHUD is not initialized yet!!!")
            }
        })
    }
    
    //MARK: Show Toast Message
    class func showToastMesaage(_ toView : UIView,message : String?,delay : TimeInterval){
        self.hud = nil
        self.hud = MBProgressHUD.showAdded(to: toView, animated: true)
        self.hud?.mode = MBProgressHUDMode.text
        self.hud!.margin = 10;
        self.hud!.offset.y = 150;
        
        if let unwrapString = message {
            self.hud!.detailsLabel.text = unwrapString;
        }
        self.hud!.removeFromSuperViewOnHide = true
        self.hud!.hide(animated: true, afterDelay: delay)
    }
    
    //MARK: Email Validation
    class func isValidEmail(_ testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    //MARK: Phone Number Validation
    class func isValidPhone(_ value: String) -> Bool {
        // let PHONE_REGEX = "^\\+\\d{3}-\\d{2}-\\d{7}$"
        let PHONE_REGEX = "^[2-9]{2}[0-9]{8}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result =  phoneTest.evaluate(with: value)
        return result
    }
    
    //MARK: AlertView without button
    class func showAlertViewOnViewController(_ viewC : UIViewController,title: String, message: String){
        
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
            alert.dismiss(animated: true, completion: { () -> Void in
                
            })
        }
        alert.addAction(okAction)
        viewC.present(alert, animated: true) { () -> Void in
        }
    }
    
    //MARK: Alert With buttons
    class func showOkCancelAlertViewOnViewController(_ viewC : UIViewController,title: String, message: String, okClickResult: @escaping (_ index: Int,_ action: UIAlertController)->(),cancelClickResult: @escaping (_ index:Int, _ action: UIAlertController)->()){
        
        let alert : UIAlertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction : UIAlertAction = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
            okClickResult(0,alert)
            
        }
        
        let cancelAction : UIAlertAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default) { (action: UIAlertAction) -> Void in
            cancelClickResult(0,alert)
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        viewC.present(alert, animated: true) { () -> Void in
        }
    }
    
    //MARK: CreateTopStatusBar
    class func createTopStatusBarOnView(_ view:UIView) -> UIView {
        let statusBarView  = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
        statusBarView.backgroundColor = UIColor.black
        statusBarView.alpha = 0.9
        return statusBarView
    }
    
    //MARK: Localized Strings
    class func returnLocalizedStringForKey (_ key : String) -> String {
        let str : String = NSString(string: key.localized(userDef.value(forKey: LANGUAGE) as! String)) as String
        return str
    }
    
    //MARK: String Underline
    class func setUnderLineOnBasisOfText(_ passedString : String, _ view : UIView?, _ color : UIColor) {
    
        
        let attributedString = NSAttributedString(string: passedString, attributes: [NSUnderlineStyleAttributeName:1,NSForegroundColorAttributeName:color])
        
        if view is UILabel {
           let lable = view as! UILabel
           lable.attributedText = attributedString
        }
        
        if view is UIButton {
        let btn = view  as! UIButton
            btn.setAttributedTitle(attributedString, for: .normal)
        }
    }
    
    
    class func setUnderLineOnBasisOfView(_ view : UIView?, _ color : UIColor) {
        
        if view is UILabel {
            let lable = view as! UILabel
            let lineView = UIView(frame: CGRect(x: 0, y: lable.frame.size.height, width: lable.frame.size.width, height: 2))
            lineView.backgroundColor = color
            lable.addSubview(lineView)
            
        }
        
        if view is UIButton {
            let btn = view  as! UIButton
            let lineView = UIView(frame: CGRect(x: 0, y: btn.frame.size.height, width: btn.frame.size.width, height: 2))
            lineView.backgroundColor = color
            btn.addSubview(lineView)
        }
    }

    
    
    
}
