//
//  TeacherTrackMilestonesViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherTrackMilestonesViewController: UIViewController {
    
    //MARK: Declarations & IBOutlets
    
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var tableViewLeft: UITableView!
    @IBOutlet weak var tableViewMiddle: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableViewRight: UITableView!
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    
        //Buttons
    @IBOutlet weak var btnKidsDisplay: UIButton!
    @IBOutlet weak var btnSaveEvaluation: UIButton!
    @IBOutlet weak var btnAddEvaluation: UIButton!
    
    
    //MARK: IBActions
    
    @IBAction func tapKidsDisplay(_ sender: Any) {
    }
    @IBAction func tapSaveEvaluation(_ sender: Any) {
        
        Utils.showOkCancelAlertViewOnViewController(self, title: "CreativeApp", message: "Are you sure to save the changes", okClickResult: { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
            Utils.showToastMesaage(self.viewMasterContainer, message: "Values saved successfully", delay: 1)
        }, cancelClickResult: { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
        })
        
    }
    @IBAction func tapAddEvalution(_ sender: Any) {
        Utils.showOkCancelAlertViewOnViewController(self, title: "CreativeApp", message: "Do you really want add new evalution", okClickResult: { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
            Utils.showToastMesaage(self.viewMasterContainer, message: "Evalution Added", delay: 1)
        }) { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: Viewlife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initialization(){
        
        //Colors
        viewTopbarContainer.backgroundColor = colorHeaderTopBar
        
        //Customization
        viewTopbarContainer.clipsToBounds = true
        
        //Underline
        Utils.setUnderLineOnBasisOfText((btnAddEvaluation.titleLabel?.text)!, btnAddEvaluation, UIColor.white)
        Utils.setUnderLineOnBasisOfText((btnSaveEvaluation.titleLabel?.text)!, btnSaveEvaluation, UIColor.white)
        
    }
}
