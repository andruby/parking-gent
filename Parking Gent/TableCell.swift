//
//  TableCell.swift
//  Parking Gent
//
//  Created by Andrew Fecheyr-Lippens on 21/12/14.
//  Copyright (c) 2014 Andrew Fecheyr-Lippens. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet var parkingName: UILabel!
    @IBOutlet var freeSpace: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
