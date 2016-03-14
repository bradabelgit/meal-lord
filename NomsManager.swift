//
//  NomsManager.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-14.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

var nomsManager: NomsManager = NomsManager()

class NomsManager: NSObject {
    
    // MARK: Properties
    
    var noms = [Nom]()
    
    // MARK: Initialization 
    
    override init () {
        super.init()
        
        self.noms = loadNoms()!
    }
    
    // MARK: Methods 
    
    func addNoms(nom: Nom) {
        noms.append(nom)
        
        saveNoms()
    }
    
    // MARK: NSCoding
    
    func saveNoms() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(noms, toFile: Nom.ArchiveURL.path!)
        
        if !isSuccessfulSave {
            print("Failed to save noms...")
        }
    }
    
    func loadNoms() -> [Nom]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Nom.ArchiveURL.path!) as? [Nom]
    }
}
