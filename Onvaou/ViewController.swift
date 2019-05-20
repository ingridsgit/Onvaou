//
//  ViewController.swift
//  Onvaou
//
//  Created by Admin on 20/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var departure_text_field: UITextField!
    @IBOutlet weak var departure_display_field: UITextView!
    @IBOutlet weak var way_date_picker: UIDatePicker!
    @IBOutlet weak var return_date_picker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func setDepartureAirport(_ sender: Any) {
        let departure = departure_text_field.text
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM YYYY"
        let wayDate = dateFormatter.string(from: way_date_picker.date)
        let returnDate = dateFormatter.string(from: return_date_picker.date)
        if let depText = departure {
            let textToBeAdded: String = "From \(depText) \(wayDate) to \(returnDate)\n"
        departure_display_field.insertText(textToBeAdded)
        }
        
        
        
    }

    

}

