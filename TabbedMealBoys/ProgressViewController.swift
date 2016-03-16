//
//  ProgressViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import RealmSwift
import GaugeKit

class ProgressViewController: UIViewController {
    var profile: Profile?
    var updateProfile: NotificationToken?
    
    @IBOutlet weak var proGauge: Gauge!
    @IBOutlet weak var proOverflowGauge: Gauge!
    @IBOutlet weak var proLabel: UILabel!
    
    @IBOutlet weak var fatGauge: Gauge!
    @IBOutlet weak var fatOverflowGauge: Gauge!
    @IBOutlet weak var fatLabel: UILabel!
    
    @IBOutlet weak var carbGauge: Gauge!
    @IBOutlet weak var carbOverflowGauge: Gauge!
    @IBOutlet weak var carbLabel: UILabel!
    
    @IBOutlet weak var calGauge: Gauge!
    @IBOutlet weak var calOverflowGauge: Gauge!
    @IBOutlet weak var calLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadProfile()
        
        let realm = try! Realm()
        

        
        updateProfile = realm.objects(Profile).addNotificationBlock {
            results, error in
            
            self.proLabel.text = String(self.profile!.goalProtein.value!) + "g"
            self.fatLabel.text = String(self.profile!.goalFat.value!) + "g"
            self.carbLabel.text = String(self.profile!.goalCarbs.value!) + "g"
            self.calLabel.text = String(self.profile!.goalCalories.value!) + "kCal"
        }        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, parentViewController!.view.frame.width, parentViewController!.view.frame.height)
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
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
}