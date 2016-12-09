//
//  TeacherDailyReportViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 09/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class TeacherDailyReportViewController: UIViewController {
    
    //MARK: Variables & IBOutlets
    
    @IBOutlet var viewTopContainer: UIView!
    @IBOutlet var labelSubject: UILabel!
    @IBOutlet var imageViewSubjectIcon: UIImageView!
    @IBOutlet var labelAttachedfiles: UILabel!
    @IBOutlet var imageViewAttachedfilesIcon: UIImageView!
    @IBOutlet var imageviewChild: UIImageView!
    
    @IBOutlet var viewBelowContainer: UIView!
    @IBOutlet var labelCameraIcon: UILabel!
    @IBOutlet var btnCameraimage: UIButton!
    @IBOutlet var labelGalleryIcon: UILabel!
    @IBOutlet var btnGalleryimage: UIButton!
    
    @IBOutlet var labelDescription: UILabel!
    @IBOutlet var textviewDescription: UITextView!
    
    @IBOutlet var btnAddEntry: UIButton!
        //Dropdown
    @IBOutlet var textfieldDropdown: UITextField!
    @IBOutlet var pickerviewDropdown: UIPickerView!
    var dropdownOptions = ["Information","Carnival","Progression","Menu","Dummy","Data"]
    
        //Image Picker
    var imagePicker = UIImagePickerController()
    
    
    //MARK: Button Actions
    @IBAction func tapCameraImage(_ sender: Any) {
        
    }
    @IBAction func tapGalleryImage(_ sender: Any) {
        
    }
    @IBAction func tapAddEntry(_ sender: Any) {
        
    }
    
    
    //MARK: View Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initializers(){
        self.navigationController?.isNavigationBarHidden = true
        imagePicker.delegate = self
    }
}

//MARK: Dropdown Extension
extension TeacherDailyReportViewController : UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dropdownOptions.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.textfieldDropdown.text = self.dropdownOptions[row]
        self.pickerviewDropdown.isHidden = true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.textfieldDropdown {
            self.pickerviewDropdown.isHidden = false
            textfieldDropdown.endEditing(true)
        }
    }
}

//MARK: ImagePicker Extension
extension TeacherDailyReportViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageviewChild.contentMode = .scaleAspectFit
            imageviewChild.image = pickedImage
        }
    }
    
}

//MARK: TableView Extension
extension TeacherDailyReportViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithoutImage")
        return cell!
    }
}
