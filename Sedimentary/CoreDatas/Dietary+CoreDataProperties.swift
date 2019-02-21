//
//  Dietary+CoreDataProperties.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/20.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//
//

import Foundation
import CoreData


extension Dietary {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dietary> {
        return NSFetchRequest<Dietary>(entityName: "Dietary")
    }

    @NSManaged public var dayOfWeek: Int16
    @NSManaged public var foods: NSSet?
    @NSManaged public var meal: Meal?

}

// MARK: Generated accessors for foods
extension Dietary {

    @objc(addFoodsObject:)
    @NSManaged public func addToFoods(_ value: Food)

    @objc(removeFoodsObject:)
    @NSManaged public func removeFromFoods(_ value: Food)

    @objc(addFoods:)
    @NSManaged public func addToFoods(_ values: NSSet)

    @objc(removeFoods:)
    @NSManaged public func removeFromFoods(_ values: NSSet)

}
