//
//  FooterTableViewCell.swift
//  DemoExpandTableView
//
//  Created by itthipon wiwatthanasathit on 8/10/2560 BE.
//  Copyright © 2560 Dev7. All rights reserved.
//

import UIKit

class FooterTableViewCell: UITableViewCell {

    @IBOutlet weak var mStackView: UIStackView!
    @IBOutlet weak var mFooterView: UIView!
    @IBOutlet weak var mFooterTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
