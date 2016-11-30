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
    
    class func stopActivityIndicator(){
        DispatchQueue.main.async(execute: { () -> Void in
            
            if let unwrapHud = self.hud {
                unwrapHud.isHidden = true
            } else {
                print("MBProgressHUD is not initialized yet!!!")
            }
        })
    }
    
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
    
    class func isValidEmail(_ testStr:String) -> Bool {
        // println("validate calendar: \(testStr)")
        let emailRegEx = "^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    class func isValidPhone(_ value: String) -> Bool {
        
       // let PHONE_REGEX = "^\\+\\d{3}-\\d{2}-\\d{7}$"
        let PHONE_REGEX = "^[2-9]{2}[0-9]{8}$"

        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        
        let result =  phoneTest.evaluate(with: value)
        
        return result
        
    }

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
    
    class func createTopStatusBarOnView(_ view:UIView) -> UIView {
    let statusBarView  = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 20))
    statusBarView.backgroundColor = UIColor.black
    statusBarView.alpha = 0.9
    return statusBarView
        
    }
    
    
    
   
    
      
    
}
