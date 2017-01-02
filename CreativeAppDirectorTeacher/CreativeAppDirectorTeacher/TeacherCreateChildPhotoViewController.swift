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
    
    var imagePicker = UIImagePickerController()
    
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
        imagePicker.allowsEditing = true
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.modalPresentationStyle = .fullScreen
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        } else {
            Utils.showAlertViewOnViewController(self, title: "CreativeApp", message: "Camera is not accessible")
        }
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
        
        //Colors
        viewTopbarContainer.backgroundColor = colorHeaderTopBar

        //Customization
        viewTopbarContainer.clipsToBounds = true
        Utils.setUnderLineOnBasisOfText((btnSendPhotos.titleLabel?.text)!, btnSendPhotos, UIColor.white)
        Utils.setUnderLineOnBasisOfText((btnTakePhotos.titleLabel?.text)!, btnTakePhotos, UIColor.white)
    }
}

extension TeacherCreateChildPhotoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            OperationQueue.main.addOperation {
//                self.imageView.contentMode = .scaleAspectFit
//                self.imageView.image = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}















