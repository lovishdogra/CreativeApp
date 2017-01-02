//
//  DirectorProfileViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

class DirectorProfileViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
    
    var imagePicker = UIImagePickerController()
    
    //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var viewBottomLeftContainer: UIView!
    @IBOutlet weak var viewBottomRightContainer: UIView!
    @IBOutlet weak var scrollView: UICollectionView!
    
    
    
    //Images
    @IBOutlet weak var imageViewKidimage: UIImageView!
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
    @IBOutlet weak var btnChildCareIcon: UIButton!
    @IBOutlet weak var btnMealIcon: UIButton!
    @IBOutlet weak var btnTransportIcon: UIButton!
    
    //Texts
    @IBOutlet weak var textViewSplNotes: UITextView!
    
    //MARK: IBActions
    
    @IBAction func tapChooseKidImage(_ sender: Any) {
        let actionSheet = UIAlertController(title: "CreativeApp", message: "Choose Image Source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(alert) in
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.modalPresentationStyle = .popover
            
            self.imagePicker.popoverPresentationController?.sourceView = self.btnChooseKidImage
            self.imagePicker.popoverPresentationController?.sourceRect = self.btnChooseKidImage.bounds
            
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
        
        if let presenter = actionSheet.popoverPresentationController {
            presenter.sourceView = btnChooseKidImage
            presenter.sourceRect = btnChooseKidImage.bounds
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
    func initialization() {
        
        //Icons
        btnChooseKidImage.setTitle("ma:photo.camera", for: .normal)
        btnChooseKidImage.parseIcon()
        btnChildCareIcon.setTitle("ma:child.care", for: .normal)
        btnChildCareIcon.parseIcon()
        btnMealIcon.setTitle("ma:restaurant.menu", for: .normal)
        btnMealIcon.parseIcon()
        btnTransportIcon.setTitle("ma:directions.bus", for: .normal)
        btnTransportIcon.parseIcon()
        
        
        //Customization
        viewTopbarContainer.clipsToBounds = true
        
        self.viewBottomLeftContainer.layer.borderWidth = 0.4
        self.viewBottomLeftContainer.layer.borderColor = UIColor.lightGray.cgColor
        self.viewBottomRightContainer.layer.borderWidth = 0.4
        self.viewBottomRightContainer.layer.borderColor = UIColor.lightGray.cgColor
        self.textViewSplNotes.layer.borderWidth = 0.2
        self.textViewSplNotes.layer.borderColor = UIColor.lightGray.cgColor
    }
}

//MARK: ImagePicker Extension
extension DirectorProfileViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            OperationQueue.main.addOperation {
                self.imageViewKidimage.contentMode = .scaleAspectFit
                self.imageViewKidimage.image = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}











