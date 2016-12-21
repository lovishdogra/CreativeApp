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
    }
    @IBAction func tapAddEvalution(_ sender: Any) {
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
        
    }
}
