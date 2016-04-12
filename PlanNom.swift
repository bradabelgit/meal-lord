//
//  PlanNom.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import Foundation
import RealmSwift

class PlanNom: Object {
    dynamic var name = ""
    dynamic var servingSizeGrams: Double = 0
    dynamic var servingProtein: Double = 0
    dynamic var servingFat: Double = 0
    dynamic var servingCarbs: Double = 0
    dynamic var section = 0
    dynamic var eaten = false
}