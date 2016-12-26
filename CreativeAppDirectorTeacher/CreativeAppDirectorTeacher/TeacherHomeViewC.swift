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
    // Array for loading the icons for the menus
    var arrOfAllChildren:[Dictionary<String, String>] =  [Dictionary<String, String>]()
    var arrOfSelectedChildren:[String] =  [String]()
    
    // Selected Index of the menu icon
    var selectedMenuIndex = 0
    
    // Master Teacher ViewControllerObject
    var masterTeacherViewC : MasterTeacherViewC?
    
        //MARK: Viewlife methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        initialization()
        
        self.collectionViewMenubar.delegate = self
        self.collectionViewMenubar.dataSource = self
        
        self.collectionViewStudentsList.delegate = self
        self.collectionViewStudentsList.dataSource = self
        
        self.collectionViewStudentsList.reloadData()
        self.collectionViewMenubar.reloadData()
        
        // Setting check controller at the very first time
        self.setNewControllerInBottomSection(index: 0)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueTeacherMainEmbed"{
            self.masterTeacherViewC = segue.destination as? MasterTeacherViewC
        }
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
    
    @IBAction func tapSelectAll(_ sender: Any) {
        
        if Singleton.shared.isAllSelectedSelected == false {
            Singleton.shared.isAllSelectedSelected = true
            self.arrOfSelectedChildren.removeAll()
            for i in 0..<self.arrOfAllChildren.count {
                let dict =  self.arrOfAllChildren[i]
                let strIndex = dict["childId"];
                self.arrOfSelectedChildren.append(strIndex!)
            }
        } else {
            Singleton.shared.isAllSelectedSelected = false
            self.arrOfSelectedChildren.removeAll()
        }
        self.collectionViewStudentsList.reloadData()
        
        
    }
    

    
    //MARK: Private Methods
    func initialization(){
        
        //Icons
        btnLogout.setTitle("fa:sign-out", for: .normal)
        btnLogout.parseIcon()
        
        btnSelectAll.setTitle("fa:users", for: .normal)
        btnSelectAll.setTitleColor(colorTopNavBarBlue, for: .normal)
        btnSelectAll.parseIcon()
        
        // Class Image
        let url = URL(string: "http://orig09.deviantart.net/9bee/f/2011/287/1/e/red_pyro_class_icon_by_slithbane-d4cv0b0.png")!
        
        self.imageViewLogo.setImageWith(url, placeholderImage: UIImage(named: "deer smile"))
        
        
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
        
        
        // Setting up dummy data for children
        for i in 1...16 {
            
            let remainder = i % 4
            
            var dictChild = Dictionary<String, String> ()
            
            if remainder == 0 {
                dictChild = ["childId":"\(i)","childName":"Child"+"\(i)","childImage":"http://www.pngpix.com/wp-content/uploads/2016/02/Baby-PNG-image-1-500x333.png"];
            } else if remainder == 1 {
                dictChild = ["childId":"\(i)","childName":"Child"+"\(i)","childImage":"https://assets.babycenter.com/ims/2014/12/US_67-181537953_4x3.jpg"];
            } else if remainder == 2 {
                dictChild = ["childId":"\(i)","childName":"Child"+"\(i)","childImage":"https://assets.babycenter.com/ims/2014/12/US_114-466375111_wide.jpg"];
            }
            else if remainder == 3 {
                dictChild = ["childId":"\(i)","childName":"Child"+"\(i)","childImage":"https://us-i5.tb.wal.co/asr/b8af1222-9636-4acf-acc3-0bc9ee6cede3_1.5cd25f64c852145ba902d133cbbaf427.jpeg?odnHeight=450&odnWidth=450&odnBg=FFFFFF"];
            }
            
            
            self.arrOfAllChildren.append(dictChild)
        }
        
        
    }
    
    // Put New ViewController
    func setNewControllerInBottomSection(index : Int) {
        
        //segueTeacherCheckIn
        //segueTeacherDailyReport
        //segueTeacherTrackMilestone
        //segueTeacherCreateEvent
        //segueTeacherCreateChildPhoto
        //segueTeacherChildProfileView
        
        switch index {
        case 0:
            self.masterTeacherViewC?.segueIndetifierReceivedFromParent(string: "segueTeacherCheckIn")
            break;
        case 1:
            self.masterTeacherViewC?.segueIndetifierReceivedFromParent(string: "segueTeacherDailyReport")
            break;
        case 2:
            self.masterTeacherViewC?.segueIndetifierReceivedFromParent(string: "segueTeacherTrackMilestone")
            break;
        case 3:
            self.masterTeacherViewC?.segueIndetifierReceivedFromParent(string: "segueTeacherCreateEvent")
            break;
        case 4:
            self.masterTeacherViewC?.segueIndetifierReceivedFromParent(string: "segueTeacherCreateChildPhoto")
            break;
        case 5:
            self.masterTeacherViewC?.segueIndetifierReceivedFromParent(string: "segueTeacherChildProfileView")
            break;
        default:
            break;
        }
        
    }
    

    
    //MARK: - UICollectionview Delegate And Datasource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewStudentsList {
            return self.arrOfAllChildren.count
            
        } else {
            return self.arrOfManuItems.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  : UICollectionViewCell?
        
        if collectionView == self.collectionViewMenubar {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
            let imageView = cell?.viewWithTag(1000) as! UIImageView
            let lblMenuName = cell?.viewWithTag(2000) as! UILabel
            lblMenuName.font = UIFont(name: "Roboto-Bold", size: 16)

            let dict = self.arrOfManuItems[indexPath.row]
            let strMenuName = dict["menuName"]
            let strMenuIcon = dict["menuIcon"]
            let url = URL(string: strMenuIcon!)
            
            lblMenuName.text = strMenuName
            
            
            imageView.clipsToBounds = true
            imageView.setImageWith(url!, placeholderImage: UIImage(named: "deer smile"))
            imageView.translatesAutoresizingMaskIntoConstraints = true;
            imageView.frame = CGRect(x: ((cell?.frame.size.width)! / 2) - (imageView.frame.size.width / 2), y: 10, width: imageView.frame.size.width, height: imageView.frame.size.width)
            imageView.layer.cornerRadius = imageView.frame.size.height / 2
            imageView.clipsToBounds = true
            
            

            
            if indexPath.row == selectedMenuIndex {
                cell?.backgroundColor = colorBlue
                lblMenuName.textColor = UIColor.white
                
            } else {
                cell?.backgroundColor = colorGrey
                lblMenuName.textColor = UIColor.black
            }
            cell?.layer.cornerRadius = 4.0
            
            
        } else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChildrenCell", for: indexPath)
            
            let imageViewChild = cell?.viewWithTag(1000) as! UIImageView
            let lblChildName = cell?.viewWithTag(2000) as! UILabel
            let btnSelected = cell?.viewWithTag(3000) as! UIButton
            
            btnSelected.isHidden = true
            btnSelected.isUserInteractionEnabled = false
            btnSelected.backgroundColor = UIColor.clear
            
            btnSelected.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 20)
            
            let dict = self.arrOfAllChildren[indexPath.row]
            let strMenuName = dict["childName"]
            let strMenuIcon = dict["childImage"]
            let url = URL(string: strMenuIcon!)
            
            lblChildName.text = strMenuName
            
            imageViewChild.translatesAutoresizingMaskIntoConstraints = true;
            imageViewChild.setImageWith(url!, placeholderImage: UIImage(named: "baby_placeholder"))
            imageViewChild.frame.size = CGSize(width: imageViewChild.frame.size.height, height: imageViewChild.frame.size.height)
            
            
            imageViewChild.layer.cornerRadius = imageViewChild.frame.size.height / 2
            
            //imageViewChild.layer.borderWidth = 2.0
            //imageViewChild.layer.borderColor = UIColor.black.cgColor
            imageViewChild.clipsToBounds = true
            
            if self.arrOfSelectedChildren.index(of: dict["childId"]!) != nil{
                btnSelected.isHidden = false
                btnSelected.setTitle("io:checkmark-circled", for: .normal)
                btnSelected.setTitleColor(colorRed, for: .normal)
                btnSelected.parseIcon()
                
            } else {
                
                
            }
        }
        
        
        return cell!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.collectionViewMenubar {
            self.selectedMenuIndex = indexPath.row
            self.collectionViewMenubar.reloadData()
            self.setNewControllerInBottomSection(index: indexPath.item)
            
        } else {
            
            let dictObject = self.arrOfAllChildren[indexPath.row]
            
            if let index = self.arrOfSelectedChildren.index(of: dictObject["childId"]!){
                self.arrOfSelectedChildren.remove(at: index)
            } else {
                self.arrOfSelectedChildren.append(dictObject["childId"]!)
            }
            
            self.collectionViewStudentsList.reloadItems(at: [indexPath])
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.collectionViewMenubar {
        let width = collectionView.frame.size.width - CGFloat(((self.arrOfManuItems.count + 2) * 10))
        let height = collectionView.frame.size.height
        
        let widhtOfCell = ((width) / CGFloat (self.arrOfManuItems.count))
        return CGSize(width: widhtOfCell, height: height)
        } else {
            return CGSize(width: 90.0 , height: 90.0)

        }
    }
    
    //Use for interspacing between cells
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    
    
}











