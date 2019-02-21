//
//  Food+CoreDataProperties.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/20.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var name: String?

}
