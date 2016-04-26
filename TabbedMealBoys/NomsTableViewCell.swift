//
//  NomsTableViewCell.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import SCLAlertView

class NomsTableViewCell: UITableViewCell {

    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var proteinText: UILabel!
    @IBOutlet weak var fatText: UILabel!
    @IBOutlet weak var carbText: UILabel!
    @IBOutlet weak var gramText: UILabel!
    
    var nom: Nom?

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
        let alert = SCLAlertView()
        let grams = alert.addTextField("Please enter quantity (g)")
        alert.showCloseButton = false
        
        alert.addButton("+ Breakfast") {
            self.addNewNom(Double(grams.text!)!, section: 0)
            alert.hideView()
        }
        alert.addButton("+ Lunch") {
            self.addNewNom(Double(grams.text!)!, section: 1)
            alert.hideView()
        }
        alert.addButton("+ Dinner") {
            self.addNewNom(Double(grams.text!)!, section: 2)
            alert.hideView()
        }
        alert.addButton("+ Pre-Workout") {
            self.addNewNom(Double(grams.text!)!, section: 3)
            alert.hideView()
        }
        alert.addButton("+ Post-Workout") {
            self.addNewNom(Double(grams.text!)!, section: 4)
            alert.hideView()
        }
        
        alert.showTitle(nom!.name, subTitle: "", style: .Edit, colorStyle: 0x99E87E)
    }
    
    func addNewNom(servingGrams: Double, section: Int) {
        let newNom = PlanNom()
        
        newNom.name = nom!.name
        newNom.section = section
        newNom.eaten = false
        
        let serving: Double = Double(nom!.servingSizeGrams)
        
        let proteinRatio: Double = Double(nom!.servingProtein)/serving
        let carbsRatio: Double = Double(nom!.servingCarbs)/serving
        let fatRatio: Double = Double(nom!.servingFat)/serving
        
        newNom.servingProtein = proteinRatio * servingGrams
        newNom.servingFat = fatRatio * servingGrams
        newNom.servingCarbs = carbsRatio * servingGrams
        newNom.servingSizeGrams = servingGrams
                        
        planMgr.addNom(newNom)
    }
}
