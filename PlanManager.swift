//
//  PlanManager.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import RealmSwift

var planMgr: PlanManager = PlanManager()

class PlanManager: NSObject {
    var plan: Plan?
    var updatePlan: NotificationToken?
    
    override init() {
        super.init()
    
        print(Realm.Configuration.defaultConfiguration.path!)
        
        loadPlan()
    }
    
    func loadPlan() {
        let realm = try! Realm()
        
        let planQuery = realm.objects(Plan)
        
        if(planQuery.count < 1) {
            plan = Plan()
            
            try! realm.write {
                realm.add(plan!)
            }
        } else {
            plan = planQuery[0]
        }
    }
    
    func addNom(nom: PlanNom) {
        let realm = try! Realm()
        
        try! realm.write {
            plan!.noms.append(nom)
        }
    }    
}