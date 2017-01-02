//
//  DirectorTrackPaymentViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

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
    @IBOutlet weak var btnLevelIcon: UIButton!
    @IBOutlet weak var btnChildCareIcon: UIButton!
    @IBOutlet weak var btnMealIcon: UIButton!
    @IBOutlet weak var btnTransportIcon: UIButton!
    
        //Images
    @IBOutlet weak var imageViewChildPhoto: UIImageView!
    
    
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
        
        //Icons
        btnLevelIcon.setTitle("ma:class", for: .normal)
        btnLevelIcon.parseIcon()
        btnChildCareIcon.setTitle("ma:child.care", for: .normal)
        btnChildCareIcon.parseIcon()
        btnMealIcon.setTitle("ma:restaurant.menu", for: .normal)
        btnMealIcon.parseIcon()
        btnTransportIcon.setTitle("ma:directions.bus", for: .normal)
        btnTransportIcon.parseIcon()
        
        //Customization
        viewTopbarContainer.clipsToBounds = true
        
        Utils.setUnderLineOnBasisOfText((btnAddPayment.titleLabel?.text)!, btnAddPayment, UIColor.white)
        
        self.viewLeftContainer.layer.borderWidth = 0.4
        self.viewLeftContainer.layer.borderColor = UIColor.lightGray.cgColor
        self.tableView.layer.borderWidth = 0.4
        self.tableView.layer.borderColor = UIColor.lightGray.cgColor
    }
}



























