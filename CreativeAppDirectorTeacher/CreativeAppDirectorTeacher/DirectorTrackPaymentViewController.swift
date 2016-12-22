//
//  DirectorTrackPaymentViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorTrackPaymentViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var viewLeftContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    
    
        //Lables
    
    @IBOutlet weak var labelBillingSummary: UILabel!
    @IBOutlet weak var labelChildName: UILabel!
    @IBOutlet weak var labelChildDOB: UILabel!
    @IBOutlet weak var labelLevel: UILabel!
    @IBOutlet weak var labelLevelData: UILabel!
    @IBOutlet weak var labelChildCarePlan: UILabel!
    @IBOutlet weak var labelChildCareData: UILabel!
    @IBOutlet weak var labelMealPlan: UILabel!
    @IBOutlet weak var labelMealPlanData: UILabel!
    @IBOutlet weak var labelTranportPlan: UILabel!
    @IBOutlet weak var labelTransportPlanData: UILabel!
    
    
        //Buttons
    @IBOutlet weak var btnAddPayment: UIButton!
    
    
    
        //Images
    @IBOutlet weak var imageViewChildPhoto: UIImageView!
    @IBOutlet weak var imageViewLevelIcon: UIImageView!
    @IBOutlet weak var imageViewChildCareicon: UIImageView!
    @IBOutlet weak var imageViewMealPlanIcon: UIImageView!
    @IBOutlet weak var imageViewTransportIcon: UIImageView!
    
    
    //MARK: IBActions
    @IBAction func tapAddPayment(_ sender: Any) {
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
        
    }
}
