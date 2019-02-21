//
//  TestViewController.swift
//  Sedimentary
//
//  Created by Zhou Wei Ran on 2019/2/13.
//  Copyright © 2019 Paper Scratch. All rights reserved.
//

import Foundation
import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var dayOfWeekPicker: UIPickerView!
    @IBOutlet weak var timePicker: UIPickerView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var foodsInput: UITextField!
    @IBOutlet weak var mealInput: UITextField!
    
    var dayOfWeekPickerDataSource = DayOfWeekPickerDataSoure()
    var timePickerDataSource: TimePickerDataSource!
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var dataOperator: DataOperator {
        return appDelegate.dataOperator!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dayOfWeekPicker.dataSource = dayOfWeekPickerDataSource
        dayOfWeekPicker.delegate = dayOfWeekPickerDataSource
        
        timePickerDataSource = TimePickerDataSource(callBack: self.timePicked)
        timePicker.dataSource = timePickerDataSource
        timePicker.delegate = timePickerDataSource
    }
    
    func timePicked(start: Int, end: Int) {
        timeLabel.text = "\(start) - \(end)"
    }
    
    @IBAction func addADietary(_ sender: Any) {
        let mealName = mealInput.text!
        let startTime = timePickerDataSource.start
        let endTime = timePickerDataSource.end
        let foodNames = foodsInput.text!.split(separator: " ").map() {
            String($0)
        }
        let foods = dataOperator.newFoods(foodNames: foodNames)
        let meal = dataOperator.newMeal(mealName, start: startTime, end: endTime)
        let dayOfWeek = dayOfWeekPickerDataSource.dayOfWeek
        dataOperator.setDietary(foods: foods, meal: meal, dayOfWeek: dayOfWeek)
    }
    
    @IBAction func back(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
