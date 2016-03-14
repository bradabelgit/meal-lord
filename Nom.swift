//
//  nom.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-14.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

class Nom: NSObject, NSCoding {
    // MARK: Prooperties 
    
    var name: String
    var servingSizeGrams: Int
    var calories: Int
    var protein: Int, fat: Int, carbs: Int
    
    // MARK: Archiving Paths 
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("noms")
    
    // MARK: Types 
    
    struct PropertyKey {
        static let nameKey = "name"
        static let servingSizeGramsKey = "servingSizeGrams"
        static let caloriesKey = "calories"
        static let proteinKey = "protein"
        static let fatKey = "fat"
        static let carbsKey = "carbs"
    }
    
    // MARK: Initialization 
    
    init? (name: String, servingSizeGrams: Int, calories: Int, protein: Int, fat: Int, carbs: Int) {
        self.name = name
        self.servingSizeGrams = servingSizeGrams
        self.calories = calories
        self.protein = protein
        self.fat = fat
        self.carbs = carbs
        
        super.init()
        
        // TODO: Type checking will go here 
        
        if false {
            return nil
        }
    }
    
    // MARK: NSCoding
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeInteger(servingSizeGrams, forKey: PropertyKey.servingSizeGramsKey)
        aCoder.encodeInteger(calories, forKey: PropertyKey.caloriesKey)
        aCoder.encodeInteger(protein, forKey: PropertyKey.proteinKey)
        aCoder.encodeInteger(fat, forKey: PropertyKey.fatKey)
        aCoder.encodeInteger(carbs, forKey: PropertyKey.carbsKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let servingSizeGrams = aDecoder.decodeIntegerForKey(PropertyKey.servingSizeGramsKey)
        let calories = aDecoder.decodeIntegerForKey(PropertyKey.caloriesKey)
        let protein = aDecoder.decodeIntegerForKey(PropertyKey.proteinKey)
        let fat = aDecoder.decodeIntegerForKey(PropertyKey.fatKey)
        let carbs = aDecoder.decodeIntegerForKey(PropertyKey.carbsKey)
        
        self.init(name: name, servingSizeGrams: servingSizeGrams, calories: calories, protein: protein, fat: fat, carbs: carbs)
    }
}
