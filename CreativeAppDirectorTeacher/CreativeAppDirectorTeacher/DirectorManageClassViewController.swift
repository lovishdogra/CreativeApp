//
//  DirectorManageClassViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 19/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorManageClassViewController: UIViewController {
    
    //MARK: Declaration & IBOutlets
        //View
    @IBOutlet weak var viewMasterContainer: UIView!
    @IBOutlet weak var viewTopbarContainer: UIView!
    @IBOutlet weak var viewBottomContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: ViewLife Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initailization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initailization(){
        
    }
}
