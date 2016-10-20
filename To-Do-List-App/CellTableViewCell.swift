//
//  CellTableViewCell.swift
//  To-Do-List-App
//
//  Created by Milan Saxena on 10/17/16.
//  Copyright © 2016 Milan Saxena. All rights reserved.
//

import UIKit

class CellTableViewCell: UITableViewCell {
    
    
   
    @IBOutlet var complete: UILabel!
    @IBOutlet var task: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
