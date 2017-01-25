//
//  EntryTableViewCell.swift
//  HealthDetective
//
//  Created by Brandi Milligan on 1/24/17.
//  Copyright © 2017 Brandi Milligan. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {

    //MARK: Properties:
    
    @IBOutlet weak var entryDetails: UILabel!
    @IBOutlet weak var entryTitle: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
