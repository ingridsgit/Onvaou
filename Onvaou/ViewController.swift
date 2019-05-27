//
//  ViewController.swift
//  Onvaou
//
//  Created by Admin on 20/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {

    
    var dataSource = ["0","1", "2", "3", "4", "5", "6", "7", "8", "9"]
    @IBOutlet weak var departure_text_field: UITextField!
    @IBOutlet weak var display_field: UITextView!
    @IBOutlet weak var way_date_picker: UIDatePicker!
    @IBOutlet weak var return_date_picker: UIDatePicker!
    @IBOutlet weak var adultsPicker: UIPickerView!
    @IBOutlet weak var childrenPickerr: UIPickerView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        display_field.text = UserData.displayViewText
        departure_text_field.becomeFirstResponder()
        departure_text_field.delegate = self
        departure_text_field.returnKeyType = UIReturnKeyType.search
        self.adultsPicker.dataSource = self
        self.adultsPicker.delegate = self
        self.childrenPickerr.dataSource = self
        self.childrenPickerr.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onSearchClicked(textField)
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let fontSize = UserData.fontSizePreference
        display_field.font = display_field.font?.withSize(CGFloat(fontSize))

        let colorChoice = UserData.colorPreference
        switch colorChoice {
        case 0:
            self.view.backgroundColor = .white
        case 1:
            self.view.backgroundColor = #colorLiteral(red: 1, green: 0.9021519494, blue: 0.9178548015, alpha: 1)
        case 2:
            self.view.backgroundColor = #colorLiteral(red: 0.790069184, green: 1, blue: 0.8657750093, alpha: 1)
        default:
            self.view.backgroundColor = UIColor.white
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        // Return a string from the array for this row.
        return dataSource[row]
    }

    @IBAction func onSearchClicked(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        dateFormatter.locale = Locale(identifier: "fr_FR")
        let date1 = way_date_picker.date
        let date2 = return_date_picker.date
        if let depText = departure_text_field.text {
            let textToDisplay: String = "Nous recherchons des vols au départ de \(depText), du \(dateFormatter.string(from: date1)) au \(dateFormatter.string(from: date2))"
            UserData.displayViewText = textToDisplay
            display_field.text = textToDisplay
        }
        UserData.displayViewText = display_field.text
        if checkDates(date1: date1, date2: date2) && checkDeparture(city: departure_text_field.text) {
            
        }
        departure_text_field.text = nil
        departure_text_field.resignFirstResponder()
        
    }
    
    @IBAction func onResetClicked(_ sender: Any) {
        UserData.displayViewText = ""
        display_field.text = UserData.displayViewText
    }
    
    func checkDates(date1: Date, date2: Date) -> Bool{
        if date2 < Date() {
            display_field.text.append("the trip is planned in the past")
            return false
        } else if date1 > date2 {
            display_field.text.append("the return date is set before the departure")
            return false
        }
        else {
            return true
        }
    }
    
    func checkDeparture(city: String?) -> Bool{
        if city == "" || city == nil{
            display_field.text.append("\nPlease select a city")
            return false
        }
        else {
            return true
        }
    }

}

