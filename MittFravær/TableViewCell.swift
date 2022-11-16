//
//  TableViewCell.swift
//  MittFravær
//
//  Created by Ole Svennevig on 23/01/2019.
//  Copyright © 2019 kvitér. All rights reserved.
//
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var lblname: UILabel!
    
    @IBOutlet var lblcapital: UILabel!
    
    @IBOutlet var name2: UILabel!
    
    @IBOutlet var imgView: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

