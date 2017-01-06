//
//  BigImageGalleryViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 03/01/17.
//  Copyright © 2017 EB. All rights reserved.
//

import UIKit

protocol ShowDataDelegate: class {
    func infoTransfer(image:UIImage, label:String)
}

class BigImageGalleryViewController: UIViewController {
    
    weak var delegate: ShowDataDelegate? = nil
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var imageViewBig: UIImageView!
    @IBOutlet weak var textViewImageName: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate?.infoTransfer(image: imageViewBig.image!, label: textViewImageName.text)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
