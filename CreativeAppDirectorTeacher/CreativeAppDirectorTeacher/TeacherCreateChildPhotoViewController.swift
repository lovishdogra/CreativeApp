//
//  TeacherCreateChildPhotoViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherCreateChildPhotoViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    
        //Buttons
    @IBOutlet weak var btnKids: UIButton!
    @IBOutlet weak var btnTakePhotos: UIButton!
    @IBOutlet weak var btnSendPhotos: UIButton!
    
    
    
    //MARK: IBActions
    @IBAction func tapKids(_ sender: Any) {
    }
    @IBAction func tapTakePhotos(_ sender: Any) {
    }
    @IBAction func tapSendPhotos(_ sender: Any) {
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
