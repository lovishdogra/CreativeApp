//
//  MasterTeacherViewC.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 24/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class MasterTeacherViewC: UIViewController {
    
    var currentViewController : UIViewController!
    var previousViewController : UIViewController!
    let segueIdentifier : String = ""

    

    //MARK: - View Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func segueIdentifierReceivedFromParent(segueIdentifier : String) {
        if segueIdentifier == "" {
        
        } else if segueIdentifier == "" {
        
        }
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if self.previousViewController != nil {
            self.previousViewController.removeFromParentViewController()
        }
        
        self.currentViewController = segue.destination as UIViewController
        self.currentViewController.view.frame = self.view.frame
        self.addChildViewController(self.currentViewController)
        self.view.addSubview(self.currentViewController.view)
        
        self.didMove(toParentViewController: self.currentViewController)
        
        self.previousViewController = self.currentViewController

    }
    
}
