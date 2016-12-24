//
//  TeacherHomeViewC.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 24/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherHomeViewC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    // Array for loading the icons for the menus
    var arrOfManuItems:[Dictionary<String, String>] =  [Dictionary<String, String>]()
    
    var selectedIndex = 0
    
    
    //MARK: IBActions
    
    @IBAction func tapLogout(_ sender: Any) {
    }
    
    @IBAction func tapSelectAll(_ sender: Any) {
    }
    
    //MARK: Viewlife methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        self.collectionViewMenubar.delegate = self
        self.collectionViewMenubar.dataSource = self
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
        
        
        let dict1 = ["menuName":"Check In","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        
        self.arrOfManuItems.append(dict1)
        
        let dict2 = ["menuName":"Daily report","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        self.arrOfManuItems.append(dict2)
        
        let dict3 = ["menuName":"Milestones","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        self.arrOfManuItems.append(dict3)
        
        let dict4 = ["menuName":"Add Event","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        self.arrOfManuItems.append(dict4)
        
        let dict5 = ["menuName":"Gallery","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        self.arrOfManuItems.append(dict5)
        
        let dict6 = ["menuName":"Profile","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        self.arrOfManuItems.append(dict6)
        
        let dict7 = ["menuName":"Manage","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        self.arrOfManuItems.append(dict7)
        
        let dict8 = ["menuName":"Payments","menuIcon":"http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png"];
        self.arrOfManuItems.append(dict8)
        

        
    }
    
    //MARK: - UICollectionview Delegate And Datasource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrOfManuItems.count
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndex = indexPath.row
        self.collectionViewMenubar.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
        let imageView = cell.viewWithTag(1000) as! UIImageView
        let lblMenuName = cell.viewWithTag(2000) as! UILabel
        
        let dict = self.arrOfManuItems[indexPath.row]
        let strMenuName = dict["menuName"]
        let strMenuIcon = dict["menuIcon"]
        let url = URL(string: strMenuIcon!)

        lblMenuName.text = strMenuName
        imageView.setImageWith(url!, placeholderImage: UIImage(named: "deer smile"))
        
        if indexPath.row == selectedIndex {
            cell.backgroundColor = colorBlue
            lblMenuName.textColor = UIColor.white

        } else {
            cell.backgroundColor = colorGrey
            lblMenuName.textColor = UIColor.black
        }
        cell.layer.cornerRadius = 4.0
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        let width = collectionView.frame.size.width - CGFloat(((self.arrOfManuItems.count + 2) * 10))
        let height = collectionView.frame.size.height

        let widhtOfCell = ((width) / CGFloat (self.arrOfManuItems.count))
        return CGSize(width: widhtOfCell, height: widhtOfCell - 10)
    }
    
    //Use for interspacing between cells
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
//    //Use for interspacing
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10.0
//    }
    
    
    
    

}











