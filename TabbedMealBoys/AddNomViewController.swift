//
//  AddNomViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import TextFieldEffects
import RealmSwift
import SCLAlertView

class AddNomViewController: UIViewController {

    @IBOutlet weak var nameText: KaedeTextField!
    @IBOutlet weak var servingSizeText: KaedeTextField!
    @IBOutlet weak var servingProteinText: KaedeTextField!
    @IBOutlet weak var servingCarbsText: KaedeTextField!
    @IBOutlet weak var servingFatText: KaedeTextField!
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, parentViewController!.view.frame.width, parentViewController!.view.frame.height)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNom(sender: AnyObject) {
        let realm = try! Realm()
        
        let newNom = Nom()
        
        newNom.name = nameText.text!
        newNom.servingSizeGrams = Double(servingSizeText.text!)!
        newNom.servingCarbs = Double(servingCarbsText.text!)!
        newNom.servingFat = Double(servingFatText.text!)!
        newNom.servingProtein = Double(servingProteinText.text!)!
        
        nameText.text = ""
        servingSizeText.text = ""
        servingCarbsText.text = ""
        servingFatText.text = ""
        servingProteinText.text = ""
        
        let parentController: MasterViewController = parentViewController as! MasterViewController
        
        parentController.scrollToIndex(3)
        
        try! realm.write {
            realm.add(newNom)
        }
        
        let alert = SCLAlertView()
        alert.showTitle(newNom.name + " added", subTitle: "", style: .Notice, colorStyle: 0x99E87E)
    }    
}
