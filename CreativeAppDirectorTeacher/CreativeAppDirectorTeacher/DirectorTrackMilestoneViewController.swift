// https://github.com/jeantimex/ios-swift-collapsible-table-section/blob/master/ios-swift-collapsible-table-section/CollapsibleTableViewController.swift
//  DirectorTrackMilestoneViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 13/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorTrackMilestoneViewController: UIViewController {
    
    //MARK: Declarations & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var tableViewLeft: UITableView!
    @IBOutlet weak var tableViewMiddle: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var tableViewScroll: UITableView!
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    
        //Buttons
    @IBOutlet weak var btnKids: UIButton!
    @IBOutlet weak var btnSaveEvaluation: UIButton!
    @IBOutlet weak var btnAddEvaluation: UIButton!
    
    //MARK: IBActions
    @IBAction func tapKids(_ sender: Any) {
        
    }
    
    @IBAction func tapSaveEvaluation(_ sender: Any) {
        
    }
    
    @IBAction func tapAddEvaluation(_ sender: Any) {
        
    }
    
    //MARK: ViewLife Methods
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
