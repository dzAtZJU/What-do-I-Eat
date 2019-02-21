//
//  utils.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/15.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//

import Foundation
import SceneKit

struct Xy: Hashable {
    let x: Int
    let y: Int
}

class RandomXy {
    let range = -2...2
    var values: Set<Xy> = []
    
    func next() -> Xy {
        while true {
            let x = Int.random(in: range)
            let y = Int.random(in: range)
            let xy = Xy(x: x, y: y)
            if !values.contains(xy) {
                values.insert(xy)
                return xy
            }
        }
    }
}

func dayOfWeekFromIndex(_ index: Int) -> Int {
    if index == 1 {
        return 7
    } else {
        return index - 1
    }
}

func currentDayAndHour() -> (Int, Int) {
    let date = Date()
    let calendar = Calendar.current
    let components: Set<Calendar.Component> = [.weekday, .hour]
    let dayAndHour = calendar.dateComponents(components, from: date)
    
    let dayOfWeek = dayOfWeekFromIndex(dayAndHour.weekday!)
    return (dayOfWeek, dayAndHour.hour!)
}
