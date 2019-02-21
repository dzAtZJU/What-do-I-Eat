//
//  DayOfWeekPicker.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/18.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//

import Foundation
import UIKit

class DayOfWeekPickerDataSoure: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var dayOfWeek = 0
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(dayOfWeekForRow(row))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        dayOfWeek = dayOfWeekForRow(row)
    }
    
    private func dayOfWeekForRow(_ row: Int) -> Int {
        if row == 0 {
            return 7
        }
        return row
    }
}
