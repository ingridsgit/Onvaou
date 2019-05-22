//
//  ViewController.swift
//  Onvaou
//
//  Created by Admin on 20/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var departure_text_field: UITextField!
    @IBOutlet weak var display_field: UITextView!
    @IBOutlet weak var way_date_picker: UIDatePicker!
    @IBOutlet weak var return_date_picker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        display_field.text = UserData.displayViewText
        departure_text_field.becomeFirstResponder()
        departure_text_field.delegate = self
        departure_text_field.returnKeyType = UIReturnKeyType.search
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


    @IBAction func onOkClicked(_ sender: Any) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        let date1 = way_date_picker.date
        let date2 = return_date_picker.date
        if let depText = departure_text_field.text {
            let textToBeAdded: String = "From \(depText) \(dateFormatter.string(from: date1)) to \(dateFormatter.string(from: date2))\n"
            let existingText = UserData.displayViewText.replacingOccurrences(of: UserData.DEFAULT_TEXT, with: "")
            display_field.text = existingText + textToBeAdded
        }
        UserData.displayViewText = display_field.text
        departure_text_field.text = nil
        departure_text_field.resignFirstResponder()
        checkDates(date1: date1, date2: date2)
    }
    
    @IBAction func onResetClicked(_ sender: Any) {
        UserData.displayViewText = ""
        display_field.text = UserData.displayViewText
    }
    
    func checkDates(date1: Date, date2: Date){
        if date2 < Date() {
            print("the trip is planned in the past")
        } else if date1 > date2 {
            print("the return date is set before the departure")
        }
    }

}

