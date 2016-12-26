//
//  MasterDirectorManageViewC.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 26/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class MasterDirectorManageViewC: UIViewController {
    
    var previousViewC : UIViewController?
    var currentViewC : UIViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func callFunction(){
    
    }
    
    func segueIdentifierFromParent(string : String) {
        print(string)
        self.performSegue(withIdentifier: string, sender: nil)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if self.previousViewC  != nil {
            self.previousViewC?.view.removeFromSuperview()
            self.previousViewC?.removeFromParentViewController()
        }
        
        
        if segue.identifier == "segueDirectorAddChild" {
            self.currentViewC = segue.destination as! UINavigationController
        } else {
            self.currentViewC = segue.destination as UIViewController
        }
        
        self.addChildViewController(self.currentViewC!)
        self.currentViewC?.view.frame = self.view.frame
        self.view.addSubview((self.currentViewC?.view)!)
        self.currentViewC?.view.clipsToBounds = true
        self.didMove(toParentViewController: self.currentViewC)
        
        self.previousViewC = self.currentViewC
        
        
        
        
       
        
        
        
    }
    
    
    
    

}
