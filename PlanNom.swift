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
    dynamic var servingSizeGrams = 0
    dynamic var servingCalories = 0
    dynamic var servingProtein = 0
    dynamic var servingFat = 0
    dynamic var servingCarbs = 0
    dynamic var eaten = false
}