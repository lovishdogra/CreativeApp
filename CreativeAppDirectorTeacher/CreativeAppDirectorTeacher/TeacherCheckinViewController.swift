//
//  CollectionViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 08/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

class TeacherCheckinViewController : UIViewController {

    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet var viewContainerMaster: UIView!
    @IBOutlet weak var viewHeaderTop: UIView!
    @IBOutlet weak var viewImageClassTopContainer: UIView!
    @IBOutlet weak var viewHeaderBottom: UIView!
    @IBOutlet weak var ViewBottomContainer: UIView!
    @IBOutlet weak var viewBottomCollectionContainer: UIView!
    
        //Labels
    @IBOutlet weak var labelDateDay: UILabel!
    @IBOutlet weak var labelTeacherWelcome: UILabel!
    @IBOutlet weak var labelLogoutBtn: UILabel!
    @IBOutlet weak var labelClassName: UILabel!
    @IBOutlet weak var labelSelectAllKidText: UILabel!
    
    
        //Buttons
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnSelectAllKidIcon: UIButton!
    @IBOutlet weak var btnConfirmCheckIn: UIButton!
    
    
    
        //Images
    @IBOutlet weak var imageViewClassIconTop: UIImageView!
    
    
        //Collections
    @IBOutlet var viewCollectionMenu: UICollectionView!
    @IBOutlet var viewCollectionChildren: UICollectionView!
    @IBOutlet var viewCollectionDetailBelow: UICollectionView!
    
    //MARK: IBActions of Buttons
    @IBAction func tapSelectAllKids(_ sender: Any) {
    }
    
    @IBAction func tapConfirmCheckIn(_ sender: Any) {
        Utils.showAlertViewOnViewController(self, title: "CreativeApp", message: Utils.returnLocalizedStringForKey("message_confirm_checkin"))
    }
    
    
    @IBAction func tapLogout(_ sender: Any) {
        Utils.showAlertViewOnViewController(self, title: "CreativeApp" , message: Utils.returnLocalizedStringForKey("message_confirm_logout"))
    }
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Initial Methods
    func initialization(){
        viewCollectionMenu.dataSource = self
        viewCollectionChildren.dataSource = self
        viewCollectionDetailBelow.dataSource = self
        
        //Icons
        btnLogout.setTitle("FA:sign-out", for: .normal)
        btnLogout.parseIcon()
        btnSelectAllKidIcon.setTitle("FA:users", for: .normal)
        btnSelectAllKidIcon.parseIcon()
        
        //Language
        labelTeacherWelcome.text = Utils.returnLocalizedStringForKey("label_teacher_welcome")
        labelLogoutBtn.text = Utils.returnLocalizedStringForKey("logout")
        labelSelectAllKidText.text = Utils.returnLocalizedStringForKey("select_all")
        btnConfirmCheckIn.setTitle(Utils.returnLocalizedStringForKey("confirm_checkin"), for: .normal)
        
        //Colors
        viewHeaderTop.layer.backgroundColor = colorTopNavBarBlue.cgColor
        viewImageClassTopContainer.layer.backgroundColor = colorLightBlue.cgColor
        btnSelectAllKidIcon.setTitleColor(colorLightBlue, for: .normal)
        
        
    }
}

//MARK: Collection View Extension
extension TeacherCheckinViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == viewCollectionMenu {
            return 1
        } else if collectionView == viewCollectionChildren {
            return 1
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == viewCollectionMenu {
            return 20
        } else if collectionView == viewCollectionChildren {
            return 40
        } else{
            return 50
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == viewCollectionMenu {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
            return cell
        } else if collectionView == viewCollectionChildren {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildrenCell", for: indexPath)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildrenDetailCell", for: indexPath)
            return cell
        }
    }
    
}
