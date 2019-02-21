//
//  DataOperator.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/12.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//

import Foundation
import CoreData

class DataOperator {
let persistenceLayer = PersistenceLayer()
    var context: NSManagedObjectContext {
        return persistenceLayer.context
    }
    
    func newFoods(foodNames: [String]) -> NSSet {
        return NSSet(array: foodNames.map() {
            newFood(foodName: $0)
        })
    }
    
    func newFood(foodName: String) -> Food {
        let food = Food(context: context)
        food.name = foodName
        return food
    }
    
    func getAllFoods() -> [String] {
        let request = NSFetchRequest<Food>(entityName: "Food")
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        do {
            let foods = try context.fetch(request)
            return foods.map() { $0.name! }
        } catch {
            print("getAllFoods error: \(error).")
        }
        
        return []
    }
    
    func newMeal(_ name: String, start: Int, end: Int) -> Meal {
        let meal = Meal(context: context)
        meal.name = name
        meal.start = Int16(start)
        meal.end = Int16(end)
        return meal
    }
    
    func getDietaryAt(day: Int, hour: Int) -> Dietary? {
        let request = NSFetchRequest<Dietary>(entityName: "Dietary")
        let predicate = NSPredicate(format: "dayOfWeek == %@ AND meal.start <= %@ AND meal.end > %@", argumentArray: [day, hour, hour])
        request.predicate = predicate
        do {
            return try context.fetch(request).first
        } catch {
            print("getDietaryAt error: \(error).")
        }
        return nil
    }
    
    func getFoodsAt(day: Int, hour: Int) -> [String] {
        if let dietary = getDietaryAt(day: day, hour: hour) {
            if let foods = dietary.foods?.allObjects as? [Food] {
                return foods.map() {
                    $0.name!
                }
            }
        }
        return []
    }
    
    func getAllMeal() -> [Meal] {
        let request = NSFetchRequest<Meal>(entityName: "Meal")
        request.sortDescriptors = [NSSortDescriptor(key: "start", ascending: true)]
        do {
            return try context.fetch(request)
        } catch {
            print("getAllMeal error: \(error).")
        }
        return []
    }
    
    func setDietary(foods: NSSet, meal: Meal, dayOfWeek: Int) {
        let dietary = Dietary(context: context)
        dietary.meal = meal
        dietary.dayOfWeek = Int16(dayOfWeek)
        dietary.addToFoods(foods)
        do {
            try context.save()
        } catch {
            print("setDietary error \(error).", error)
        }
    }
    
    func getFoodsOfDietary(meal: String, dayOfWeek: Int) -> [Food] {
        let request = NSFetchRequest<Dietary>(entityName: "Dietary")
        let predicate = NSPredicate(format: "dayOfWeek == %@ AND meal.name == %@", argumentArray: [dayOfWeek, meal])
        request.predicate = predicate
        
        do {
            let dietaryies = try context.fetch(request)
            let foods = dietaryies.first?.foods
            if let foods = foods {
                return foods.allObjects as! [Food]
            }
            return []
        } catch {
            print("getFoodsOfDietary error: \(error).")
        }
        
        return []
    }
    
}
