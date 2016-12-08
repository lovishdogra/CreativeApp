//
//  CollectionViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 08/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherCheckinViewController : UIViewController {

    //MARK: Declaration & IBOutlets
        //Container Views
    @IBOutlet var viewContainerMaster: UIView!
    @IBOutlet var viewContainerNavbar: UIView!
    
        //Navbar Contents
    @IBOutlet var imageViewNavbar: UIImageView!
    @IBOutlet var labelDateNavbar: UILabel!
    @IBOutlet var labelInitialsNavbar: UILabel!
    @IBOutlet var btnExitNavbar: UIButton!
    @IBOutlet var labelLogoutNavbar: UILabel!
    
        //Collection View 1
    @IBOutlet var labelClassName: UILabel!
    //@IBOutlet var cellMenu: UICollectionViewCell!
    //@IBOutlet var btnCellMenu: UIButton!
    //@IBOutlet var labelCellMenu: UILabel!
    
        //Collection View 2
    @IBOutlet var btnChildrenSelectAll: UIButton!
    @IBOutlet var labelChildrenSelectAll: UILabel!
    //@IBOutlet var cellChildren: UICollectionViewCell!
    //@IBOutlet var imageViewCellChildren: UIImageView!
    //@IBOutlet var labelCellChildren: UILabel!
    
        //Collection Views
    @IBOutlet var viewCollectionMenu: UICollectionView!
    @IBOutlet var viewCollectionChildren: UICollectionView!
    @IBOutlet var viewCollectionDetailBelow: UICollectionView!
    
    
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
