//
//  RegistTableCellTableViewCell.swift
//  tpapp
//
//  Created by 胡博豪 on 2018/3/27.
//  Copyright © 2018年 胡博豪. All rights reserved.
//

import UIKit

class RegistTableCellTableViewCell: UITableViewCell {

    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var ValueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
