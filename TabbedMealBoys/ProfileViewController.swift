//
//  ProfileViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-14.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import RealmSwift

class ProfileViewController: UIViewController {
    
    var profile: Profile?
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var caloriesText: UITextField!
    @IBOutlet weak var proteinText: UITextField!
    @IBOutlet weak var fatText: UITextField!
    @IBOutlet weak var carbsText: UITextField!
    
    init () {
        super.init(nibName: "ProfileViewController", bundle: nil)
        
        loadProfile()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.text = profile!.name ?? ""
        caloriesText.text = profile!.goalCalories.value != nil ? String(profile!.goalCalories.value!) : ""
        proteinText.text = profile!.goalProtein.value != nil ? String(profile!.goalProtein.value!) : ""
        fatText.text = profile!.goalFat.value != nil ? String(profile!.goalFat.value!) : ""
        carbsText.text = profile!.goalCarbs.value != nil ? String(profile!.goalCarbs.value!) : ""
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, parentViewController!.view.frame.width, parentViewController!.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadProfile() {
        let realm = try! Realm()
        
        let profileQuery = realm.objects(Profile)
        
        if profileQuery.count > 0 {
            profile = profileQuery[0]
        } else {
            profile = Profile()
            
            try! realm.write {
                realm.add(profile!)
            }
        }
    }
    
    @IBAction func updateProfile(sender: AnyObject) {
        let realm = try! Realm()
        
        try! realm.write {
            profile!.name = nameText.text
            profile!.goalCalories.value = Int(caloriesText.text!)
            profile!.goalProtein.value = Int(proteinText.text!)
            profile!.goalFat.value = Int(fatText.text!)
            profile!.goalCarbs.value = Int(carbsText.text!)
        }
        
        let parentController: MasterViewController = parentViewController as! MasterViewController
        
        parentController.scrollToIndex(0)
    }
    
    // MARK: NSCoding

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
