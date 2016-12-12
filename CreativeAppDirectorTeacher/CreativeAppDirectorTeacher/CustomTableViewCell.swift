//
//  CustomTableViewCell.swift
//  CreativeAppDirectorTeacher
//
//  Created by Lovish Dogra on 12/12/16.
//  Copyright © 2016 EB. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    //MARK: Declaration & IBOutlets
    @IBOutlet weak var labelHeaderDate: UILabel!
    
    //MARK: Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
