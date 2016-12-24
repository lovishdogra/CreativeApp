//
//  TeacherHomeViewC.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 24/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherHomeViewC: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewTopMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var collectionViewMenubar: UICollectionView!
    @IBOutlet weak var viewSubClassLogoContainer: UIView!
    @IBOutlet weak var collectionViewStudentsList: UICollectionView!
    @IBOutlet weak var viewContainerView: UIView!
    
        //Buttons
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnSelectAll: UIButton!
    
        //Labels
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelLogout: UILabel!
    @IBOutlet weak var labelWelcomeTeacher: UILabel!
    @IBOutlet weak var labelClassName: UILabel!
    @IBOutlet weak var labelSelectAll: UILabel!
    
        //Images
    @IBOutlet weak var imageViewLogo: UIImageView!
    
    //MARK: IBActions
    
    @IBAction func tapLogout(_ sender: Any) {
    }
    
    @IBAction func tapSelectAll(_ sender: Any) {
    }
    
    //MARK: Viewlife methods
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
        btnSelectAll.setTitle("fa:users", for: .normal)
        btnSelectAll.parseIcon()
        
        
    }
}











