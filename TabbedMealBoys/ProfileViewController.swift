//
//  ProfileViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-14.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import RealmSwift
import TextFieldEffects

class ProfileViewController: UIViewController {
    
    var profile: Profile?
    

    @IBOutlet weak var nameText: KaedeTextField!
    @IBOutlet weak var proteinText: KaedeTextField!
    @IBOutlet weak var fatText: KaedeTextField!
    @IBOutlet weak var carbsText: KaedeTextField!
    
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
            profile!.goalProtein.value = Int(proteinText.text!)
            profile!.goalFat.value = Int(fatText.text!)
            profile!.goalCarbs.value = Int(carbsText.text!)
        }
        
        let parentController: MasterViewController = parentViewController as! MasterViewController
        
        parentController.scrollToIndex(0)
    }
}
