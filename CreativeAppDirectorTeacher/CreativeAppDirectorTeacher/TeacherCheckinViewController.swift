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
        Utils.showAlertViewOnViewController(self, title: "CreativeApp", message: Utils.returnLocalizedStringForKey("message_confirm_checkin"))
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
       
        Utils.setUnderLineOnBasisOfText((btnConfirmCheckin.titleLabel?.text)!, btnConfirmCheckin,UIColor.white)
        
    }
}
