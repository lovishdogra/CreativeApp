// https://github.com/jeantimex/ios-swift-collapsible-table-section/blob/master/ios-swift-collapsible-table-section/CollapsibleTableViewController.swift
//  DirectorTrackMilestoneViewController.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 13/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class DirectorTrackMilestoneViewController: UIViewController {
    
    //MARK: Table Collapsing Menu Data
    struct Section {
        var name: String!
        var items: [String]!
        var collapsed: Bool!
        
        init(name: String, items: [String], collapsed: Bool = false) {
            self.name = name
            self.items = items
            self.collapsed = collapsed
        }
    }
    
    //MARK: Declarations & IBOutlets
    var sections = [Dictionary<String,[String]>]()
    
    var arrIndexPath = [Int]()

    
    
    @IBOutlet weak var tableViewCollapse: UITableView!
    
    
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
        
        self.tableViewCollapse.delegate = self
        self.tableViewCollapse.dataSource = self
        
        let dict1 = ["A":["1","2","3","4"]]
        let dict2 = ["B":["1","2","3","4"]]
        let dict3 = ["C":["1","2","3","4"]]
        let dict4 = ["D":["1","2","3","4"]]
        let dict5 = ["E":["1","2","3","4"]]
        
        self.sections.append(dict1)
        self.sections.append(dict2)
        self.sections.append(dict3)
        self.sections.append(dict4)
        self.sections.append(dict5)
    }
    
    func tapbutton(sender : UIButton) {

        print(sender.tag)
        arrIndexPath.removeAll()
        arrIndexPath.append(sender.tag)
        self.tableViewCollapse.reloadData()
    }
}

//MARK: TableView Extension
extension DirectorTrackMilestoneViewController : UITableViewDataSource, UITableViewDelegate {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        let dict = sections[section]
        if section == 0 {
            if self.arrIndexPath.contains(section) {
                self.arrIndexPath.remove(at: 0)
                return (dict["A"]?.count)!
            } else {
            
                    return 0
            }
        } else if section == 1 {
            if self.arrIndexPath.contains(section) {
                self.arrIndexPath.remove(at: 0)
                return (dict["B"]?.count)!
            } else {
                return 0
            }
        }
        return 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableCell", for: indexPath)
        
        let dict = sections[indexPath.section]

        if indexPath.section == 0 {

            let arr =  dict["A"]
            cell.textLabel?.text = (arr![indexPath.row] )
        } else if indexPath.section == 1 {
            let arr =  dict["B"]
            cell.textLabel?.text = (arr![indexPath.row] )
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50 ))
        btn.backgroundColor = UIColor.red
        btn.setTitle("Title", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(DirectorTrackMilestoneViewController.tapbutton), for: .touchUpInside)
        btn.tag = section
        return btn
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}
