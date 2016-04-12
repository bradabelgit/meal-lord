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
    var updatePlan: NotificationToken?
    
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
            
            self.updateGauges()
        }
        
        updatePlan = realm.objects(Plan).addNotificationBlock {
            results, error in
            
            self.updateGauges()
        }
    }
    
    func updateGauges() {
        var EatenFat: Double = 0
        var EatenCarb: Double = 0
        var EatenPro: Double = 0
        var EatenCal: Double = 0
        
        for task in planMgr.plan!.noms {
            if (task.eaten) {
                EatenFat = EatenFat + Double(task.servingFat)
                EatenCarb = EatenCarb + Double(task.servingCarbs)
                EatenPro = EatenPro + Double(task.servingProtein)
                
                print ("pro \(task.servingProtein)")
                print ("carbs \(task.servingCarbs)")
                print ("fat \(task.servingFat)")
                
                EatenCal = EatenCal + Double(task.servingProtein * 4) + Double(task.servingCarbs * 4) + Double(task.servingFat * 9)
            }
        }
        
        print ("eaten cal \(EatenCal)")
        
        let profileFat = self.profile!.goalFat.value != nil ? self.profile!.goalFat.value! : 0
        let profilePro = self.profile!.goalProtein.value != nil ? self.profile!.goalProtein.value! : 0
        let profileCarb = self.profile!.goalCarbs.value != nil ? self.profile!.goalCarbs.value! : 0
        let profileCal = (profileFat * 9) + (profilePro * 4) + (profileCarb * 4)        
        
        let fatLeft: Double = Double(profileFat) - EatenFat
        let proLeft: Double = Double(profilePro) - EatenPro
        let carbLeft: Double = Double(profileCarb) - EatenCarb
        let calLeft: Double = Double(profileCal) - EatenCal
        
        let fatPercent: Int
        let proPercent: Int
        let carbPercent: Int
        let calPercent: Int
        
        fatPercent = (profileFat > 0) ? Int((EatenFat / Double(profileFat))*100) : 0
        proPercent = (profilePro > 0) ? Int((EatenPro / Double(profilePro))*100) : 0
        carbPercent = (profileCarb > 0) ? Int((EatenCarb / Double(profileCarb))*100) : 0
        calPercent = (profileCal > 0) ? Int((EatenCal / Double(profileCal))*100) : 0
        
        // Setting Label Values
        self.fatLabel.text = String(Int(fatLeft)) + "g"
        self.proLabel.text = String(Int(proLeft)) + "g"
        self.carbLabel.text = String(Int(carbLeft)) + "g"
        self.calLabel.text = String(Int(calLeft)) + "kcal"
        
        // Setting Gauge Values
        self.fatGauge.rate = CGFloat(fatPercent)
        self.proGauge.rate = CGFloat(proPercent)
        self.carbGauge.rate = CGFloat(carbPercent)
        self.calGauge.rate = CGFloat(calPercent)
        
        // Overflow Calorie Gauge
        if (calPercent > 100) {
            let remainingCals = calPercent - 100
            self.calOverflowGauge.hidden = false;
            self.calOverflowGauge.rate = CGFloat(remainingCals)
            self.calLabel.text = String("+" + String(Int(EatenCal) - Int(profileCal))+"Kcal")
            
        }
        else{
            self.calOverflowGauge.hidden = true;
        }
        // **************************************
        
        // Overflow Protein Gauge
        if (proPercent > 100) {
            let remainingPro = proPercent - 100
            self.proOverflowGauge.hidden = false;
            self.proOverflowGauge.rate = CGFloat(remainingPro)
            self.proLabel.text = String("+" + String(Int(EatenPro) - Int(profilePro))+"g")
        }
        else{
            self.proOverflowGauge.hidden = true;
        }
        // **************************************
        
        // Overflow Fat Gauge
        if (fatPercent > 100) {
            let remainingFat = fatPercent - 100
            self.fatOverflowGauge.hidden = false;
            self.fatOverflowGauge.rate = CGFloat(remainingFat)
            self.fatLabel.text = String("+" + String(Int(EatenFat) - Int(profileFat))+"g")
        }
        else{
            self.fatOverflowGauge.hidden = true;
        }
        // **************************************
        
        // Overflow Carb Gauge
        if (carbPercent > 100) {
            let remainingCarbs = carbPercent - 100
            self.carbOverflowGauge.hidden = false;
            self.carbOverflowGauge.rate = CGFloat(remainingCarbs)
            self.carbLabel.text = String("+" + String(Int(EatenCarb) - Int(profileCarb))+"g")
        }
        else{
            self.carbOverflowGauge.hidden = true;
        }
        // **************************************
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
}