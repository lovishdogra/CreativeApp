//
//  DirectorCreateDailyReportViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 13/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorCreateDailyReportViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewMasterController: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewScrollContainer: UIView!
    @IBOutlet weak var viewScrollTopContainer: UIView!
    @IBOutlet weak var viewScrollBottomContainer: UIView!
    @IBOutlet weak var tableView: UITableView!
    
        //Labels
    @IBOutlet weak var labelSelectStandards: UILabel!
    @IBOutlet weak var labelClass: UILabel!
    @IBOutlet weak var labelAutoApprove: UILabel!
    @IBOutlet weak var labelSubject: UILabel!
    @IBOutlet weak var labelCameraIcon: UILabel!
    @IBOutlet weak var labelGalleryIcon: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
        //Buttons
    @IBOutlet weak var btnSwitch: UISwitch!
    @IBOutlet weak var btnDeleteIcon: UIButton!
    @IBOutlet weak var btnIcon: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnGallery: UIButton!
    @IBOutlet weak var btnAddEntry: UIButton!
    
        //Texts
    @IBOutlet weak var textFieldSubject: UITextField!
    @IBOutlet weak var textViewDescription: UITextView!
    
        //Images
    @IBOutlet weak var imageViewChildPhoto: UIImageView!
    
    //MARK: IBActions
    @IBAction func tapSwitchAutoApprove(_ sender: Any) {
    }
    @IBAction func tapDeleteAction(_ sender: Any) {
    }
    @IBAction func tapIcon(_ sender: Any) {
    }
    @IBAction func tapCamera(_ sender: Any) {
    }
    @IBAction func tapGallery(_ sender: Any) {
    }
    @IBAction func tapAddEntry(_ sender: Any) {
    }
    
    //MARK:ViewLife Methods
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
