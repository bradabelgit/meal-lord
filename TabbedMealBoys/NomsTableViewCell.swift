//
//  NomsTableViewCell.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

class NomsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var caloriesText: UILabel!
    @IBOutlet weak var proteinText: UILabel!
    @IBOutlet weak var fatText: UILabel!
    @IBOutlet weak var carbText: UILabel!

    weak var masterViewController: MasterViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func AddToPlan(sender: AnyObject) {
        let newNom = PlanNom()
        
        newNom.name = nameText.text!
        newNom.servingCalories = Int(caloriesText.text!)!
        newNom.servingProtein = Int(proteinText.text!)!
        newNom.servingFat = Int(fatText.text!)!
        newNom.servingCarbs = Int(carbText.text!)!
        
        planMgr.addNom(newNom)
        
        masterViewController!.scrollToIndex(1)
    }
}
