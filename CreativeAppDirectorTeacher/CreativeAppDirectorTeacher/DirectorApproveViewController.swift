//
//  DirectorApproveViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorApproveViewController: UIViewController {

    //MARK: Declaration & IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: ViewLife Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initializers()

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Private Methods
    func initializers(){
        tableView.delegate = self
        tableView.dataSource = self;
    }
}

//MARK: Table View Controller Extension
extension DirectorApproveViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! CustomTableViewCell
        headerCell.backgroundColor = UIColor.green
        
        return headerCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellWithoutImage", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Rohit Singh"
    }
    
}
