//
//  DirectorManageClassViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorManageClassViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    //MARK: Declaration & IBOutlets
        //View
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Array for managing the options of Manage Collectionview
    var arrOfOptions: [String] = [String]()
    
    // Object of MasterManageClass
    
    var manageMasterViewC : MasterDirectorManageViewC?
    
    //MARK: ViewLife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initailization()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initailization(){
        
        //Customization
        viewTopbarContainer.clipsToBounds = true
        
        /*
         "create_level" = "Manage Level";
         "create_class" = "Manage Class";
         "add_child" = "Add Child";
         "move_child" = "Move Child";
         "payment" = "Payment";
         "milestone" = "Milestones";
         "create_meal" = "Manage Meal";
         */
        self.arrOfOptions.append(Utils.returnLocalizedStringForKey("create_level"))
        self.arrOfOptions.append(Utils.returnLocalizedStringForKey("create_class"))
        self.arrOfOptions.append(Utils.returnLocalizedStringForKey("add_child"))
        self.arrOfOptions.append(Utils.returnLocalizedStringForKey("move_child"))
        self.arrOfOptions.append(Utils.returnLocalizedStringForKey("payment"))
        self.arrOfOptions.append(Utils.returnLocalizedStringForKey("milestone"))
        self.arrOfOptions.append(Utils.returnLocalizedStringForKey("create_meal"))

        
    }
    
    
    //MARK: - UICollectionview Delegate And Datasource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.arrOfOptions.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "ManageCell", for: indexPath)
        let btnOptionName = cell.viewWithTag(1000) as! UIButton
        let strNameOfOption = self.arrOfOptions[indexPath.item] as String
        btnOptionName.titleLabel?.textColor = UIColor.white
        btnOptionName.titleLabel?.font = UIFont(name: "Roboto-Regular", size: 16)
        btnOptionName.setTitle(strNameOfOption, for: .normal)
        Utils.setUnderLineOnBasisOfText(strNameOfOption, btnOptionName, UIColor.white)
        btnOptionName.isUserInteractionEnabled = false

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        
       
            let width = collectionView.frame.size.width - CGFloat(((self.arrOfOptions.count) * 10))
            let height = collectionView.frame.size.height
            let widhtOfCell = ((width) / CGFloat (self.arrOfOptions.count))
            return CGSize(width: widhtOfCell, height: height)
        
    }
    
    //Use for interspacing between cells
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    // Did select Item at indexpath of collection view
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //segueDirectorCreateLevel
        //segueDirectorCreateClass
        //segueDirectorMoveChild
        //segueDirectorAddChild - Navigation controller here
        //segueDirectorAddPayment
        //segueDirectorAddMilestone
        //segueDirectorCreateMeal
        
        self.setNewViewController(index: indexPath.item)
        
    }
    
    
    func setNewViewController(index : Int){
    
        print(index)
        switch index {
        case 0:
        self.manageMasterViewC?.segueIdentifierFromParent(string: "segueDirectorCreateLevel")
        break;
            
        case 1:
        self.manageMasterViewC?.segueIdentifierFromParent(string: "segueDirectorCreateClass")
        break;
            
        case 2:
        self.manageMasterViewC?.segueIdentifierFromParent(string: "segueDirectorAddChild")
        break;
            
        case 3:
        self.manageMasterViewC?.segueIdentifierFromParent(string: "segueDirectorMoveChild")
        break;
            
        case 4:
        self.manageMasterViewC?.segueIdentifierFromParent(string: "segueDirectorAddPayment")
        break;
            
        case 5:
        self.manageMasterViewC?.segueIdentifierFromParent(string: "segueDirectorAddMilestone")
        break;
            
        case 6:
        self.manageMasterViewC?.segueIdentifierFromParent(string: "segueDirectorCreateMeal")
        break;
            
        default:
        break;
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueDirectorEmbedManage" {
            
            self.manageMasterViewC = segue.destination as? MasterDirectorManageViewC
            
        }
    }
    
    

}
