//
//  DirectorHomeViewC.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 24/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

class DirectorHomeViewC: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewTopMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var collectionViewMenu: UICollectionView!
    @IBOutlet weak var collectionViewClassName: UICollectionView!
    @IBOutlet weak var viewContainerView: UIView!
    
        //Buttons
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnSelectKids: UIButton!
    @IBOutlet weak var btnSelectStandards: UIButton!
    
        //Labels
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelLogout: UILabel!
    @IBOutlet weak var labelWelcomeDirector: UILabel!
    @IBOutlet weak var labelSelectKids: UILabel!
    
    //MARK: IBActions
    @IBAction func tapLogout(_ sender: Any) {
    }
    @IBAction func tapSelectKids(_ sender: Any) {
    }
    @IBAction func tapSelectStandards(_ sender: Any) {
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
        
        //Icons
        btnLogout.setTitle("fa:sign-out", for: .normal)
        btnLogout.parseIcon()
        btnSelectKids.setTitle("fa:users", for: .normal)
        btnSelectKids.parseIcon()
        
        //Button Custom Title
        btnSelectStandards.contentVerticalAlignment = UIControlContentVerticalAlignment.center
    }
}












