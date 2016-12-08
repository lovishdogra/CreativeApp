//
//  CollectionViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 08/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    //MARK: Declaration & IBOutlets
    
    @IBOutlet var viewCollectionMenu: UICollectionView!
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        initialization()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Initial Methods
    func initialization(){
        viewCollectionMenu.dataSource = self
    }
}

//MARK: Collection View Extension
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == viewCollectionMenu{
            return 20
        } else {
            return 40;
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath)
        return cell
    }
    
}
