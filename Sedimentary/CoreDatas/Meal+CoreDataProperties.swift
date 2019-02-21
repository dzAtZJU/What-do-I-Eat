//
//  Meal+CoreDataProperties.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/20.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var name: String?
    @NSManaged public var start: Int16
    @NSManaged public var end: Int16

}
