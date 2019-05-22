//
//  UserData.swift
//  Onvaou
//
//  Created by Admin on 22/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class UserData {
    static let DEFAULT_TEXT = "Please pick a date and departure"
    static let KEY_COLOR = "key_color"
    static let KEY_FONT_SIZE = "key_font_size"
    static let KEY_TEXT = "key_text"
    
    static var colorPreference: Int {
        get {
            return UserDefaults.standard.integer(forKey: KEY_COLOR)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: KEY_COLOR)
        }
    }
    
    static var fontSizePreference: Float {
        get {
            return UserDefaults.standard.float(forKey: KEY_FONT_SIZE)
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: KEY_FONT_SIZE)
        }
    }

    static var displayViewText: String {
        get {
            return UserDefaults.standard.string(forKey: KEY_TEXT) ?? ""
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: KEY_TEXT)
        }
    }
    
    static func registerDefaultSettings(){
        UserDefaults.standard.register(defaults: [KEY_FONT_SIZE : 20.0])
        UserDefaults.standard.register(defaults: [KEY_COLOR : 0])
        UserDefaults.standard.register(defaults: [KEY_TEXT : UserData.DEFAULT_TEXT])
    }
    
}
