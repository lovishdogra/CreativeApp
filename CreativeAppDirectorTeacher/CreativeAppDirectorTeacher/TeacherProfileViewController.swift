//
//  TeacherProfileViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherProfileViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
    
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var viewLeftContainer: UIView!
    @IBOutlet weak var viewRightContainer: UIView!
    @IBOutlet weak var scrollView: UICollectionView!
    
        //Images
    @IBOutlet weak var imageViewKidPhoto: UIImageView!
    @IBOutlet weak var imageViewChildCareIcon: UIImageView!
    @IBOutlet weak var imageViewMealPlanIcon: UIImageView!
    @IBOutlet weak var imageViewTransportationPlan: UIImageView!
    @IBOutlet weak var imageViewMom: UIImageView!
    @IBOutlet weak var imageViewDad: UIImageView!
    @IBOutlet weak var imageViewSplNotesIcon: UIImageView!
    
    
        //Texts
    @IBOutlet weak var textViewSplNotes: UITextView!
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    @IBOutlet weak var labelKidName: UILabel!
    @IBOutlet weak var labelKidDOB: UILabel!
    @IBOutlet weak var labelChildCarePlan: UILabel!
    @IBOutlet weak var labelChildCareData: UILabel!
    @IBOutlet weak var labelMealPlan: UILabel!
    @IBOutlet weak var labelMealPlanData: UILabel!
    @IBOutlet weak var labelTransportationPlan: UILabel!
    @IBOutlet weak var labelTransportationPlanData: UILabel!
    @IBOutlet weak var labelParents: UILabel!
    @IBOutlet weak var labelMomName: UILabel!
    @IBOutlet weak var labelMomNumber: UILabel!
    @IBOutlet weak var labelDadName: UILabel!
    @IBOutlet weak var labelDadNumber: UILabel!
    @IBOutlet weak var labelOtherGuardian: UILabel!
    @IBOutlet weak var labelSplNotes: UILabel!
    
        //Buttons
    @IBOutlet weak var btnKidsDisplay: UIButton!
    @IBOutlet weak var btnChooseImageIcon: UIButton!
    
    //MARK:IBActions
    @IBAction func tapKidsDisplay(_ sender: Any) {
    }
    @IBAction func tapChooseImage(_ sender: Any) {
    }
    
    
    //MARK: ViewLife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initialization(){
        //Customization
        viewTopbarContainer.clipsToBounds = true
        
    }
}
