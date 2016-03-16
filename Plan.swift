//
//  Plan.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import Foundation
import RealmSwift

class Plan: Object {
    let noms = List<PlanNom>()
}
