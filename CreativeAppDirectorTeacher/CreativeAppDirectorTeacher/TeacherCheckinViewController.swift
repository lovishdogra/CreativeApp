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
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    
        //Buttons
    @IBOutlet weak var btnConfirmCheckin: UIButton!
    @IBOutlet weak var btnKidsDisplay: UIButton!
   
    
    //MARK: IBActions of Buttons
    @IBAction func tapConfirmCheckin(_ sender: Any) {
    }
    
    @IBAction func tapConfirmCheckIn(_ sender: Any) {
        Utils.showAlertViewOnViewController(self, title: "CreativeApp", message: Utils.returnLocalizedStringForKey("message_confirm_checkin"))
    }
    
    
    @IBAction func tapLogout(_ sender: Any) {
        Utils.showAlertViewOnViewController(self, title: "CreativeApp" , message: Utils.returnLocalizedStringForKey("message_confirm_logout"))
    }
    @IBAction func tapKidDisplay(_ sender: Any) {
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
        
    }
}
