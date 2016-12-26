//
//  MasterDirectorVC.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 24/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class MasterDirectorViewC: UIViewController {
    
    var currentViewController : UIViewController!
    var previousViewController : UIViewController!

    
    //MARK: Viewlifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: Private method for managing the various view contollers
    func segueIndetifierReceivedFromParent(string: String){
        print(string)
            self.performSegue(withIdentifier: string, sender: nil)
    }
    
    
    // MARK: - Navigationte
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if self.previousViewController != nil {
            self.previousViewController.view.removeFromSuperview()
            self.previousViewController.removeFromParentViewController()
        }
        
        self.currentViewController = segue.destination as UIViewController
        self.addChildViewController(self.currentViewController)
        self.currentViewController.view.frame = self.view.frame
        self.view.addSubview(self.currentViewController.view)
        self.currentViewController.view.clipsToBounds = true

        // After setting up the current view controller just notifiy the current view controller
        self.didMove(toParentViewController: self.currentViewController)
        
        self.previousViewController = self.currentViewController
        
        
    }
    

}
