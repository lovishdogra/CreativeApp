//
//  TeacherProfileViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

class TeacherProfileViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
    
    let imagePicker = UIImagePickerController()
    
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var viewLeftContainer: UIView!
    @IBOutlet weak var viewRightContainer: UIView!
    @IBOutlet weak var scrollView: UICollectionView!
    
        //Images
    @IBOutlet weak var imageViewKidPhoto: UIImageView!
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
    
    @IBOutlet weak var btnChildCareIcon: UIButton!
    
    @IBOutlet weak var btnMealIcon: UIButton!
    
    @IBOutlet weak var btnTransportIcon: UIButton!
    
    //MARK:IBActions
    @IBAction func tapKidsDisplay(_ sender: Any) {
    }
    
    @IBAction func tapChooseImage(_ sender: Any) {
        
        let actionSheet = UIAlertController(title: "CreativeApp", message: "Choose Image Source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(alert) in
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.modalPresentationStyle = .popover
            
            self.imagePicker.popoverPresentationController?.sourceView = self.btnChooseImageIcon
            self.imagePicker.popoverPresentationController?.sourceRect = self.btnChooseImageIcon.bounds
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: {(alert) in
            self.imagePicker.allowsEditing = true
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                self.imagePicker.modalPresentationStyle = .fullScreen
                self.imagePicker.sourceType = .camera
                
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {
                Utils.showAlertViewOnViewController(self, title: "CreativeApp", message: "Camera Not Accessible")
            }
        }))
        
        
        //actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        
        if let presenter = actionSheet.popoverPresentationController {
            presenter.sourceView = btnChooseImageIcon
            presenter.sourceRect = btnChooseImageIcon.bounds
        }
        
        self.present(actionSheet, animated: true, completion: nil)
        
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
        
        imagePicker.delegate = self
        
        //Colors
        viewTopbarContainer.backgroundColor = colorHeaderTopBar
        viewLeftContainer.layer.borderColor = UIColor.lightGray.cgColor
        viewLeftContainer.layer.borderWidth = 0.5
        viewRightContainer.layer.borderColor = UIColor.lightGray.cgColor
        viewRightContainer.layer.borderWidth = 0.5
        textViewSplNotes.layer.borderColor = UIColor.lightGray.cgColor
        textViewSplNotes.layer.borderWidth = 0.5
        
        //Icons
        btnChooseImageIcon.setTitle("ma:photo.camera", for: .normal)
        btnChooseImageIcon.parseIcon()
        btnChildCareIcon.setTitle("ma:child.care", for: .normal)
        btnChildCareIcon.parseIcon()
        btnMealIcon.setTitle("ma:restaurant.menu", for: .normal)
        btnMealIcon.parseIcon()
        btnTransportIcon.setTitle("ma:directions.bus", for: .normal)
        btnTransportIcon.parseIcon()
        
        //Customization
        viewTopbarContainer.clipsToBounds = true
        
    }
}

//MARK: ImagePicker Extension
extension TeacherProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            OperationQueue.main.addOperation {
                self.imageViewKidPhoto.contentMode = .scaleAspectFit
                self.imageViewKidPhoto.image = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}































