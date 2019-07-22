//
//  SettingListCell.swift
//  DidNotKnow
//
//  Created by XuWeinan on 2019/7/3.
//  Copyright © 2019 徐炜楠. All rights reserved.
//

import UIKit

class SettingListCell: UITableViewCell {

    @IBOutlet weak var settingItemLb: UILabel!
    @IBOutlet var settingItemImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
