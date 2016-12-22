//
//  DirectorMoveChildViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorMoveChildViewController: UIViewController {
    
    //MARK:Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    
    
        //Labels
    @IBOutlet weak var labelCurrentLevel: UILabel!
    @IBOutlet weak var labelCurrentClass: UILabel!
    @IBOutlet weak var labelNewLevel: UILabel!
    @IBOutlet weak var labelNewClass: UILabel!
    
        //Buttons
    @IBOutlet weak var btnCancel: UIButton!
    @IBOutlet weak var btnSave: UIButton!
    
    
        //Texts
    @IBOutlet weak var textFieldChooseLevel: UITextField!
    @IBOutlet weak var textFieldChooseNewLevel: UITextField!
    @IBOutlet weak var textFieldEnterClassName: UITextField!
    @IBOutlet weak var textFieldEnterNewClassName: UITextField!
    
    
    //MARK: IBActions
    @IBAction func tapCancel(_ sender: Any) {
    }
    @IBAction func tapSave(_ sender: Any) {
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
