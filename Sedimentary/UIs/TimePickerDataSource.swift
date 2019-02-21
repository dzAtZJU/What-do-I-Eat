//
//  TimePicker.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/18.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//

import Foundation
import UIKit

class TimePickerDataSource: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    init(callBack: @escaping (Int, Int) -> Void) {
        self.callBack = callBack
    }
    
    var start = 11
    
    var end: Int {
        return start + 1
    }
    
    var callBack: (Int, Int) -> Void
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 18
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(startForRow(row))
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        start = startForRow(row)
        self.callBack(start, end)
    }
    
    private func startForRow(_ row: Int) -> Int {
        return 6 + row
    }
}

