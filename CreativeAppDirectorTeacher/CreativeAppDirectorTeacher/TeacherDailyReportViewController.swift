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
    
        //Views
    @IBOutlet weak var ViewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var scrollview: UIScrollView!
    @IBOutlet weak var viewContainerScroll: UIView!
    @IBOutlet weak var viewScrollUpper: UIView!
    @IBOutlet weak var viewScrollBottom: UIView!
    @IBOutlet weak var tableView: UITableView!
    
        //Label
    @IBOutlet weak var labelSelectedKids: UILabel!
    @IBOutlet weak var labelSubject: UILabel!
    @IBOutlet weak var labelCameraIcon: UILabel!
    @IBOutlet weak var labelGalleryIcon: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    
        //Buttons
    @IBOutlet weak var btnKidsDisplay: UIButton!
    @IBOutlet weak var btnCamera: UIButton!
    @IBOutlet weak var btnGallery: UIButton!
    @IBOutlet weak var btnAddEntry: UIButton!
    
        //TextViews
    @IBOutlet weak var textFieldSubject: UITextField!
    @IBOutlet weak var textViewDescription: UITextView!
    
    
        //ImageViews
    @IBOutlet weak var imageViewIcon: UIImageView!
    @IBOutlet weak var imageViewChild: UIImageView!
    
    
        //Image Picker
    var imagePicker = UIImagePickerController()
    
    
    //MARK: Button Actions
    @IBAction func tapKidsDisplay(_ sender: Any) {
    }
    @IBAction func tapCamera(_ sender: Any) {
    }
    @IBAction func tapGallery(_ sender: Any) {
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


//MARK: ImagePicker Extension
extension TeacherDailyReportViewController : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageViewChild.contentMode = .scaleAspectFit
            imageViewChild.image = pickedImage
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
