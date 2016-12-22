//
//  DirectorProfileViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorProfileViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var viewBottomLeftContainer: UIView!
    @IBOutlet weak var viewBottomRightContainer: UIView!
    @IBOutlet weak var scrollView: UICollectionView!
    
    
    
        //Images
    @IBOutlet weak var imageViewKidimage: UIImageView!
    @IBOutlet weak var imageViewChildCareIcon: UIImageView!
    @IBOutlet weak var imageViewMealPlanIcon: UIImageView!
    @IBOutlet weak var imageViewTransportIcon: UIImageView!
    @IBOutlet weak var imageViewMom: UIImageView!
    @IBOutlet weak var imageViewDad: UIImageView!
    @IBOutlet weak var imageSplNoteIcon: UIImageView!
    
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    @IBOutlet weak var labelClassName: UILabel!
    @IBOutlet weak var labelKidName: UILabel!
    @IBOutlet weak var labelkidDOB: UILabel!
    @IBOutlet weak var labelChildCarePlan: UILabel!
    @IBOutlet weak var labelChildCareData: UILabel!
    @IBOutlet weak var labelMealPlan: UILabel!
    @IBOutlet weak var labelMealPlanData: UILabel!
    @IBOutlet weak var labelTransportationPlan: UILabel!
    @IBOutlet weak var labelTransportationData: UILabel!
    @IBOutlet weak var labelParent: UILabel!
    @IBOutlet weak var labelMomName: UILabel!
    
    @IBOutlet weak var labelMomNum: UILabel!
    @IBOutlet weak var labelDadName: UILabel!
    @IBOutlet weak var labelDadNum: UILabel!
    @IBOutlet weak var labelOtherGuardian: UILabel!
    @IBOutlet weak var labelSplNotes: UILabel!
    
        //Buttons
    @IBOutlet weak var btnChooseKidImage: UIButton!
    
    
        //Texts
    @IBOutlet weak var textViewSplNotes: UITextView!
    
    
    
    //MARK: IBActions
    
    @IBAction func tapChooseKidImage(_ sender: Any) {
    }
    
    
    //MARK: ViewLife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
