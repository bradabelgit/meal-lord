//
//  Profile.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-15.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import Foundation
import RealmSwift

class Profile: Object {
    dynamic var name: String?
    let goalProtein = RealmOptional<Int>()
    let goalFat = RealmOptional<Int>()
    let goalCarbs = RealmOptional<Int>()
}