//
//  DataCell.swift
//  DidNotKnow
//
//  Created by 徐炜楠 on 2019/6/30.
//  Copyright © 2019 徐炜楠. All rights reserved.
//

import UIKit

class DataCell: UITableViewCell {

    @IBOutlet var word: UILabel!
    @IBOutlet var attitude: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
