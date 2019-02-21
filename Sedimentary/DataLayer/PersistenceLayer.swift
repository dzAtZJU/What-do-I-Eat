//
//  PersistenceLayer.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/12.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//

import Foundation
import CoreData

class PersistenceLayer: NSObject {
    var persistentContainer: NSPersistentContainer
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    override init() {
        persistentContainer = NSPersistentContainer(name: "dietary")
        persistentContainer.loadPersistentStores() {
            (description, error) in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
    
}

