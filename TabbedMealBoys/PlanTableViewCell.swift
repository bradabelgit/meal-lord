//
//  PlanTableViewCell.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

class PlanTableViewCell: UITableViewCell {
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var proteinText: UILabel!
    @IBOutlet weak var fatText: UILabel!
    @IBOutlet weak var carbsText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
