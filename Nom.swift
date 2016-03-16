//
//  nom.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-14.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import Foundation
import RealmSwift

class Nom: Object {
    dynamic var name = ""
    dynamic var servingCalories = 0
    dynamic var servingProtein = 0
    dynamic var servingFat = 0
    dynamic var servingCarbs = 0
}
