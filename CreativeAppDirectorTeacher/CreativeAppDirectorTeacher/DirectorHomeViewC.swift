//
//  DirectorHomeViewC.swift
//  CreativeAppDirectorTeacher
//
//  Created by Rohit Singh on 24/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

class DirectorHomeViewC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    //MARK: Declaration & IBOutlets
    
    var activeField : UITextField?
    
        //Views
    @IBOutlet weak var viewTopMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var collectionViewMenu: UICollectionView!
    @IBOutlet weak var collectionViewClassName: UICollectionView!
    @IBOutlet weak var viewContainerView: UIView!
    
    @IBOutlet weak var scrollView: UIScrollView!
        //Buttons
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnSelectKids: UIButton!
    @IBOutlet weak var btnSelectStandards: UIButton!
    
        //Labels
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelLogout: UILabel!
    @IBOutlet weak var labelWelcomeDirector: UILabel!
    @IBOutlet weak var labelSelectKids: UILabel!
    
    @IBOutlet weak var lblSelectClass: UILabel!
    @IBOutlet weak var btnSelectClass: UIButton!
    // Array for loading the icons for the menus
    var arrOfManuItems:[Dictionary<String, String>] =  [Dictionary<String, String>]()
    
    // Array for loading the icons for the menus
    var arrOfAllChildren:[Dictionary<String, String>] =  [Dictionary<String, String>]()
    var arrOfSelectedChildren:[String] =  [String]()
    
    // Array for managing classes
    var arrOfAllClasses:[Dictionary<String, String>] =  [Dictionary<String, String>]()
    var arrOfSelectedClasses:[String] =  [String]()
    
    // Selected Index of the menu icon
    var selectedMenuIndex = 0
    
    
    
    // Object of Master View Controller of Director Application
    var masterViewC : MasterDirectorViewC?

    
    //MARK: Viewlife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        initialization()
        
        self.collectionViewMenu.delegate = self
        self.collectionViewMenu.dataSource = self
        
        self.collectionViewClassName.delegate = self
        self.collectionViewClassName.dataSource = self
        
        //self.collectionViewStudentsList.reloadData()
        self.collectionViewMenu.reloadData()
        
        //        // By Default puttin new controller
        //        self.putNewControllerOnTheBasisOfIndex(index: 0)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }

    
    
    
    //MARK: IBActions
    @IBAction func tapLogout(_ sender: Any) {

        Utils.showOkCancelAlertViewOnViewController(self, title: kAppName, message: Utils.returnLocalizedStringForKey("logout_confirmation"), okClickResult: { (index: Int, alert : UIAlertController) in
            

            //clearing all the stored values from user default
            Singleton.shared.clearUserDefaultStoredValues()
            
            _ = self.navigationController?.popViewController(animated: true)

            alert.dismiss(animated: true, completion: {
                
            })
            
        }) { (index: Int, alert :UIAlertController) in
            
            alert.dismiss(animated: true, completion: {
                
            })

        }
    }
    @IBAction func tapSelectKids(_ sender: Any) {
    }
    @IBAction func tapSelectStandards(_ sender: Any) {
    }
    
    @IBAction func tapSelectClass(_ sender: Any) {
        
        if Singleton.shared.isAllSelectedSelected == false {
            Singleton.shared.isAllSelectedSelected = true
            self.arrOfSelectedClasses.removeAll()
            for i in 0..<self.arrOfAllClasses.count {
                let dict =  self.arrOfAllClasses[i]
                let strIndex = dict["classId"];
                self.arrOfSelectedClasses.append(strIndex!)
            }
        } else {
            Singleton.shared.isAllSelectedSelected = false
            self.arrOfSelectedClasses.removeAll()
        }
        self.collectionViewClassName.reloadData()

    }
    
    
    //MARK: Private Methods
    func initialization(){
        
        self.collectionViewMenu.backgroundColor = UIColor.white
        
        //Keyboard Notification
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DirectorHomeViewC.dismissKeyboard))
//        view.addGestureRecognizer(tap)
        registerForKeyboardNotifications()

        //Icons
        btnLogout.setTitle("fa:sign-out", for: .normal)
        btnLogout.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 20)

        btnLogout.parseIcon()
        
        btnSelectKids.setTitle("fa:users", for: .normal)
        btnSelectKids.setTitleColor(UIColor.white, for: .normal)
        btnSelectKids.backgroundColor = colorRed
        btnSelectKids.parseIcon()
        labelSelectKids.backgroundColor = UIColor.clear
        labelSelectKids.textColor = UIColor.white
        labelSelectKids.font = UIFont(name: "Roboto-Regular", size: 18)

        
        //btnSelectStandards.backgroundColor = colorTopNavBarBlue
        btnSelectStandards.setTitle(Utils.returnLocalizedStringForKey("select_standards"), for: .normal)
        btnSelectStandards.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        btnSelectStandards.setTitleColor(UIColor.white, for: .normal)
        
        //Button Custom Title
        //btnSelectStandards.contentVerticalAlignment = UIControlContentVerticalAlignment.center
        
        btnSelectClass.setTitle("fa:users", for: .normal)
        //btnSelectClass.titleLabel?.textColor = colorTopNavBarBlue
        //btnSelectClass.setTitleColor(colorTopNavBarBlue, for: .normal)
        btnSelectClass.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 30)
        btnSelectClass.backgroundColor = colorGray
        btnSelectClass.parseIcon()
        lblSelectClass.text =  Utils.returnLocalizedStringForKey("select_all_class")
        lblSelectClass.textColor = UIColor.black
        lblSelectClass.backgroundColor = UIColor.clear
        self.collectionViewClassName.backgroundColor = colorGray
        
        
        // Setting Up Icons Dummy Data for popolating in colletion view of menuitems
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
        
        
        
        // Setting up dummy data for classren
        for i in 1...16 {
            
            let remainder = i % 4
            
            var dictclass = Dictionary<String, String> ()
            
            if remainder == 0 {
                dictclass = ["classId":"\(i)","className":"class"+"\(i)","classImage":"http://www.pngpix.com/wp-content/uploads/2016/02/Baby-PNG-image-1-500x333.png"];
            } else if remainder == 1 {
                dictclass = ["classId":"\(i)","className":"class"+"\(i)","classImage":"https://assets.babycenter.com/ims/2014/12/US_67-181537953_4x3.jpg"];
            } else if remainder == 2 {
                dictclass = ["classId":"\(i)","className":"class"+"\(i)","classImage":"https://assets.babycenter.com/ims/2014/12/US_114-466375111_wide.jpg"];
            }
            else if remainder == 3 {
                dictclass = ["classId":"\(i)","className":"class"+"\(i)","classImage":"https://us-i5.tb.wal.co/asr/b8af1222-9636-4acf-acc3-0bc9ee6cede3_1.5cd25f64c852145ba902d133cbbaf427.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF"];
            }
            
            self.arrOfAllClasses.append(dictclass)
        } // End of For loop
        

    }
    
    
    
    //MARK: - UICollectionview Delegate And Datasource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewClassName {
            return self.arrOfAllClasses.count
            
        } else {
            return self.arrOfManuItems.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  : UICollectionViewCell?
        
        if collectionView == self.collectionViewMenu {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
            let imageView = cell?.viewWithTag(1000) as! UIImageView
            let lblMenuName = cell?.viewWithTag(2000) as! UILabel
            lblMenuName.font = UIFont(name: "Roboto-Bold", size: 16)
            let dict = self.arrOfManuItems[indexPath.item]
            let strMenuName = dict["menuName"]
            let strMenuIcon = dict["menuIcon"]
            let url = URL(string: strMenuIcon!)
            
            //UILable of menu
            lblMenuName.text = strMenuName
            
            //ImageView of Menu
            imageView.clipsToBounds = true
            imageView.setImageWith(url!, placeholderImage: UIImage(named: "deer smile"))
            imageView.translatesAutoresizingMaskIntoConstraints = true;
            imageView.frame = CGRect(x: ((cell?.frame.size.width)! / 2) - (imageView.frame.size.width / 2), y: 20, width: imageView.frame.size.width, height: imageView.frame.size.height)
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.clipsToBounds = true

            
            if indexPath.row == selectedMenuIndex {
                cell?.backgroundColor = colorBlue
                lblMenuName.textColor = UIColor.white
                
            } else {
                cell?.backgroundColor = colorGray
                lblMenuName.textColor = UIColor.black
            }
            
            cell?.layer.cornerRadius = 6.0
            
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ClassCell", for: indexPath)
            cell?.backgroundColor = colorGray
            
            let imageViewClass = cell?.viewWithTag(1000) as! UIImageView
            let lblClassName = cell?.viewWithTag(2000) as! UILabel
            let btnSelected = cell?.viewWithTag(3000) as! UIButton
            
            btnSelected.isHidden = true
            btnSelected.isUserInteractionEnabled = false
            btnSelected.backgroundColor = UIColor.clear
            btnSelected.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20)
            btnSelected.titleLabel?.textColor = colorRed
            btnSelected.setTitle("io:checkmark-circled", for: .normal)
            btnSelected.setTitleColor(colorRed, for: .normal)
            btnSelected.parseIcon()

            let dict = self.arrOfAllClasses[indexPath.item]
            let strClassName = dict["className"]
            let strClassIcon = dict["classImage"]
            let url = URL(string: strClassIcon!)
            
            lblClassName.text = strClassName
            
            imageViewClass.translatesAutoresizingMaskIntoConstraints = true;
            imageViewClass.setImageWith(url!, placeholderImage: UIImage(named: "deer smile"))
            imageViewClass.frame.size = CGSize(width: imageViewClass.frame.size.height, height: imageViewClass.frame.size.height)
            imageViewClass.layer.cornerRadius = imageViewClass.frame.size.height / 2
            imageViewClass.clipsToBounds = true

            
            //imageViewChild.layer.borderWidth = 2.0
            //imageViewChild.layer.borderColor = UIColor.black.cgColor
            
            if self.arrOfSelectedClasses.index(of: dict["classId"]!) != nil{
                btnSelected.isHidden = false
            } else {
                btnSelected.isHidden = true
            }
        }
        
        
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
        if collectionView == self.collectionViewMenu {
        let width = collectionView.frame.size.width - CGFloat(((self.arrOfManuItems.count) * 10))
        //let height = collectionView.frame.size.height
        
        let widhtOfCell = ((width) / CGFloat (self.arrOfManuItems.count))
        return CGSize(width: widhtOfCell, height: widhtOfCell - 10)
        } else {
            return CGSize(width: 90.0, height: 90.0)

        }
    }
    
    //Use for interspacing between cells
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    // Did select Item at indexpath of collection view
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewMenu {
            self.selectedMenuIndex = indexPath.row
            self.collectionViewMenu.reloadData()
            self.putNewControllerOnTheBasisOfIndex(index: indexPath.item)
            
        } else {
            let dictObject = self.arrOfAllClasses[indexPath.item]
            
            if let index = self.arrOfSelectedClasses.index(of: dictObject["classId"]!){
                self.arrOfSelectedClasses.remove(at: index)
            } else {
                self.arrOfSelectedClasses.append(dictObject["classId"]!)
            }
            
            //print(self.arrOfSelectedClasses)
            self.collectionViewClassName.reloadItems(at: [indexPath])
        }
    }
    
    
    // 
    func putNewControllerOnTheBasisOfIndex(index: Int){
    
        //segueDirectorCheckin
        //segueDirectorDailyReport
        //segueDirectorTrackMilestone
        //segueDirectorCreateEvent
        //segueDirectorChildPhoto
        //segueDirectorViewChildProfile
        //segueDirectorManageSchool
        //segueDirectorTrackPayment
        switch index {
        case 0:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorCheckin")
        break;
        case 1:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorDailyReport")
        break;
        case 2:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorTrackMilestone")
        break;
        case 3:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorCreateEvent")
        break;
        case 4:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorChildPhoto")
        break;
        case 5:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorViewChildProfile")
        break;
        case 6:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorManageSchool")
        break;
        case 7:
        self.masterViewC?.segueIndetifierReceivedFromParent(string: "segueDirectorTrackPayment")
        break;
        default:
        break;
        }
    }
    
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueEmbedDirector"{
            self.masterViewC = segue.destination as? MasterDirectorViewC
        }
    }
    
    
}

//MARK: Keyboard Action Extension
extension DirectorHomeViewC {
    //KeyBoard Dismissal Function
    func registerForKeyboardNotifications(){
        //Adding notifies on keyboard appearing
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func deregisterFromKeyboardNotifications(){
        //Removing notifies on keyboard appearing
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    func keyboardWasShown(notification: NSNotification){
        //Need to calculate keyboard exact size due to Apple suggestions
        self.scrollView.isScrollEnabled = true
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        var aRect : CGRect = self.view.frame
        aRect.size.height -= keyboardSize!.height
        if let activeField = self.activeField {
            if (!aRect.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func keyboardWillBeHidden(notification: NSNotification) {
        //Once keyboard disappears, restore original positions
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets : UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, -keyboardSize!.height, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
        self.scrollView.isScrollEnabled = false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField){
        activeField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        activeField = nil
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}












