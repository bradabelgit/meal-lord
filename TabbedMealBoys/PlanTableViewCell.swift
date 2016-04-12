//
//  PlanTableViewCell.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import RealmSwift

func colorWithHexString (hex:String) -> UIColor {
    var cString:String = hex.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet()).uppercaseString
    
    if (cString.hasPrefix("#")) {
        cString = (cString as NSString).substringFromIndex(1)
    }
    
    if (cString.characters.count != 6) {
        return UIColor.grayColor()
    }
    
    let rString = (cString as NSString).substringToIndex(2)
    let gString = ((cString as NSString).substringFromIndex(2) as NSString).substringToIndex(2)
    let bString = ((cString as NSString).substringFromIndex(4) as NSString).substringToIndex(2)
    
    var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
    NSScanner(string: rString).scanHexInt(&r)
    NSScanner(string: gString).scanHexInt(&g)
    NSScanner(string: bString).scanHexInt(&b)
    
    
    return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
}

class PlanTableViewCell: UITableViewCell {
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var proteinText: UILabel!
    @IBOutlet weak var fatText: UILabel!
    @IBOutlet weak var carbsText: UILabel!
    @IBOutlet weak var eatButton: UIButton!

    var planNom: PlanNom?
    var token: NotificationToken?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup () {
        nameText.backgroundColor = colorWithHexString(planNom!.eaten ? "De553F" : "99E87E");
        eatButton.setTitle(planNom!.eaten ? "-" : "+", forState: UIControlState.Normal)
        eatButton.backgroundColor = colorWithHexString(planNom!.eaten ? "De553F" : "99E87E");
    }
    
    @IBAction func toggleEaten(sender: AnyObject) {
        let realm = try! Realm()
        
        try! realm.write {
            planNom!.eaten = !planNom!.eaten
        }
        
        setup()
    }
}
