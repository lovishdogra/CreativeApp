//
//  DirectorChildPhotoViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 13/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorChildPhotoViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
    
    var imagePicker = UIImagePickerController()
    
        //Views
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
        //Labels
    @IBOutlet weak var labelSelectedKids: UILabel!
    @IBOutlet weak var labelClassName: UILabel!
    
    
        //Buttons
    @IBOutlet weak var btnTakePhotos: UIButton!
    @IBOutlet weak var btnSendPhotos: UIButton!
    
    
    //MARK: IBActions
    
    @IBAction func tapTakePhotos(_ sender: Any) {
        let actionSheet = UIAlertController(title: "CreativeApp", message: "Choose Image Source", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: {(alert) in
            self.imagePicker.allowsEditing = true
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.modalPresentationStyle = .popover
            
            self.imagePicker.popoverPresentationController?.sourceView = self.btnTakePhotos
            self.imagePicker.popoverPresentationController?.sourceRect = self.btnTakePhotos.bounds
            
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
            presenter.sourceView = btnTakePhotos
            presenter.sourceRect = btnTakePhotos.bounds
        }
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBAction func tapSendPhotos(_ sender: Any) {
        
    }
    
    //MARK: Viewlife Methods
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
        Utils.setUnderLineOnBasisOfText((btnTakePhotos.titleLabel?.text)!, btnTakePhotos, UIColor.white)
        Utils.setUnderLineOnBasisOfText((btnSendPhotos.titleLabel?.text)!, btnSendPhotos, UIColor.white)
    }
}

//MARK: ImagePicker Extension
extension DirectorChildPhotoViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            OperationQueue.main.addOperation {
//                self.imageViewKidPhoto.contentMode = .scaleAspectFit
//                self.imageViewKidPhoto.image = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}

























