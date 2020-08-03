//
//  SettingsViewController.swift
//  Tip Calculater
//
//  Created by Yao on 8/2/20.
//  Copyright © 2020 Yao. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var SettingsView: UIView!
    @IBOutlet weak var Tab1: UISlider!
    @IBOutlet weak var Tab1Label: UILabel!
    @IBOutlet weak var Tab2: UISlider!
    @IBOutlet weak var Tab2Label: UILabel!
    @IBOutlet weak var Tab3: UISlider!
    @IBOutlet weak var Tab3Label: UILabel!
    @IBOutlet weak var DarkMode: UISwitch!
    @IBOutlet var allLabels: [UILabel]!

    let defaults = UserDefaults.standard
    let light = UIColor(white: 0.95, alpha: 1)
    let dark = UIColor(white: 0.3, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        Tab1Label.text = defaults.string(forKey: "Tab1") ?? "10%"
        Tab2Label.text = defaults.string(forKey: "Tab2") ?? "18%"
        Tab3Label.text = defaults.string(forKey: "Tab3") ?? "20%"
        let DarkModeOn = defaults.bool(forKey: "DarkMode")
        if DarkModeOn {
            SettingsView.backgroundColor = dark
            DarkMode.isOn = true
            for label in allLabels{
              label.textColor = light
            }
            
        }
        else {
            SettingsView.backgroundColor = light
            DarkMode.isOn = false
            for label in allLabels{
              label.textColor = dark
            }
        }
    }

    @IBAction func DarkModeSwitch(_ sender: UISwitch) {
        if DarkMode.isOn {
            SettingsView.backgroundColor = dark
            for label in allLabels{
              label.textColor = light
            }
        }
        else {
            SettingsView.backgroundColor = light
            for label in allLabels{
              label.textColor = dark
            }
        }
        
        defaults.set(DarkMode.isOn, forKey: "DarkMode")
    }
    
    @IBAction func Tab1(_ sender: UISlider) {
        Tab1Label.text = String(format: "%.1f%%", Tab1.value)
        defaults.set(Tab1Label.text, forKey: "Tab1")
        
    }
    @IBAction func Tab2(_ sender: UISlider) {
        
        Tab2Label.text =  String(format: "%.1f%%", Tab2.value)
        defaults.set(Tab2Label.text, forKey: "Tab2")
    }
    @IBAction func Tab3(_ sender: UISlider) {
        
        Tab3Label.text =  String(format: "%.1f%%", Tab3.value)
        defaults.set(Tab3Label.text, forKey: "Tab3")
    }
    // Set a String value for some key.
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
