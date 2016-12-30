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
        
        //Color
        viewTopbarContainer.backgroundColor = colorHeaderTopBar
       
        //Customization
        Utils.setUnderLineOnBasisOfText((btnConfirmCheckin.titleLabel?.text)!, btnConfirmCheckin,UIColor.white)
        viewTopbarContainer.clipsToBounds = true
        
    }
}

extension TeacherCheckinViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->UICollectionViewCell{
        
        let collectionCell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "ChildrenDetailCell", for: indexPath) as! CheckInCollectionViewCell
        let dummyImage = UIImage(named:"login_below_image")
        collectionCell.imageViewChild.image = dummyImage
        collectionCell.labelChildName.text = "yoyo honey singh"
        collectionCell.switchChildSelection.isOn = false

        return collectionCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
}


























