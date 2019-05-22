//
//  SettingsViewController.swift
//  Onvaou
//
//  Created by Admin on 21/05/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var color_tab: UISegmentedControl!
    @IBOutlet weak var font_size_label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColorDisplay(colorIndex: UserData.colorPreference)
        setFontSizeDisplay(fontSize: UserData.fontSizePreference)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSliderTouched(_ sender: Any) {
        setFontSizeDisplay(fontSize: slider.value)
    }
    
    @IBAction func onTabClicked(_ sender: Any) {
        UserData.colorPreference = color_tab.selectedSegmentIndex
    }
    
    func setFontSizeDisplay(fontSize fontsize: Float){
        font_size_label.font = UIFont.systemFont(ofSize: CGFloat(fontsize))
        slider.value = fontsize
    }
    
    func setColorDisplay(colorIndex: Int){
        color_tab.selectedSegmentIndex = colorIndex
    }
    
    @IBAction func onSaveClicked(_ sender: Any) {
        UserData.fontSizePreference = slider.value
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
