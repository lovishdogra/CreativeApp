//
//  DirectorCreateDailyReportViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 13/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit
import SwiftIconFont

class DirectorCreateDailyReportViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
    
    var imagePicker = UIImagePickerController()
    
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
        
        Utils.showOkCancelAlertViewOnViewController(self, title: "CreativeApp", message: "Are you sure about to delete all?", okClickResult: { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
        }) { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func tapIcon(_ sender: Any) {
        
    }
    
    @IBAction func tapCamera(_ sender: Any) {
        self.imageViewChildPhoto.isHidden = false
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            Utils.showAlertViewOnViewController(self, title: "CreativeApp", message: "Camera Device Not Accessible")
        }
    }
    
    @IBAction func tapGallery(_ sender: Any) {
        self.imageViewChildPhoto.isHidden = false
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.modalPresentationStyle = .popover
        
        imagePicker.popoverPresentationController?.sourceView = btnGallery
        imagePicker.popoverPresentationController?.sourceRect = btnGallery.bounds
        
        self.present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func tapAddEntry(_ sender: Any) {
        Utils.showOkCancelAlertViewOnViewController(self, title: "CreativeApp", message: "Do you really want to add entry", okClickResult: { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
        }) { (index, alert) in
            alert.dismiss(animated: true, completion: nil)
        }
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
        
        //Icons
        btnDeleteIcon.setTitle("ma:delete", for: .normal)
        btnDeleteIcon.setTitleColor(UIColor.white, for: .normal)
        btnDeleteIcon.parseIcon()
        
        //Customization
        viewTopbarContainer.clipsToBounds = true
        
        btnSwitch.clipsToBounds = true
        btnSwitch.onTintColor = UIColor.green
        btnSwitch.tintColor = UIColor.orange
        btnSwitch.backgroundColor = UIColor.orange
        
        self.viewScrollTopContainer.layer.borderColor = UIColor.lightGray.cgColor
        self.viewScrollTopContainer.layer.borderWidth = 0.4
        self.viewScrollBottomContainer.layer.borderWidth = 0.4
        self.viewScrollBottomContainer.layer.borderColor = UIColor.lightGray.cgColor
        self.tableView.layer.borderWidth = 0.4
        self.tableView.layer.borderColor = UIColor.lightGray.cgColor
    }
}

//MARK: ImagePicker Extension
extension DirectorCreateDailyReportViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            
            OperationQueue.main.addOperation {
                self.imageViewChildPhoto.contentMode = .scaleAspectFit
                self.imageViewChildPhoto.image = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
}


























