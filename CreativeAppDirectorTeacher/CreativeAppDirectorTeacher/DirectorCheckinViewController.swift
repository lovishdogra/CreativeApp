//
//  DirectorCheckinViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 13/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorCheckinViewController: UIViewController {
    
    //MARK:Declaration & IBOutlets
    
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
        //Labels
    @IBOutlet weak var labelSelectStandard: UILabel!
    
    @IBOutlet weak var labelClass: UILabel!
    
        //Buttons
    @IBOutlet weak var btnConfirmCheckin: UIButton!
    
    
    //MARK: IBActions
    @IBAction func tapConfirmCheckin(_ sender: Any) {
    }
    
    //MARK: LifeCycle Methods
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
