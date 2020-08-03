//
//  ViewController.swift
//  Tip Calculater
//
//  Created by Yao on 8/2/20.
//  Copyright © 2020 Yao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var CalculatorView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var SplitControl: UISegmentedControl!
    @IBOutlet var allLabels: [UILabel]!
    
    let defaults = UserDefaults.standard
    let light = UIColor(white: 0.9, alpha: 1)
    let dark = UIColor(white: 0.3, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()

        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billField.becomeFirstResponder()
        
        let defaults = UserDefaults.standard

        let tipControl1 = defaults.string(forKey: "Tab1") ?? "10%"
        let tipControl2 = defaults.string(forKey: "Tab2") ?? "18%"
        let tipControl3 = defaults.string(forKey: "Tab3") ?? "20%"
        tipControl.setTitle(tipControl1, forSegmentAt:0);
        tipControl.setTitle(tipControl2, forSegmentAt:1);
        tipControl.setTitle(tipControl3, forSegmentAt:2);
        
        let DarkMode = defaults.bool(forKey: "DarkMode")
                
        if DarkMode {
            CalculatorView.backgroundColor = dark
            for label in allLabels{
              label.textColor = light
            }
        }
        else {
            CalculatorView.backgroundColor = light
            for label in allLabels{
              label.textColor = dark
            }
        }

    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        
        let bill = Double(billField.text!) ?? 0
        
        let selectedTab = tipControl.titleForSegment(at: tipControl.selectedSegmentIndex)!
        
        let percentage = Double(selectedTab.components(separatedBy: "%")[0])! * 0.01
        
        let tip = bill * percentage
        
        let subtotal = bill + tip
        
        let split = [1.0, 2.0, 3.0]
        
        let total = subtotal / split [SplitControl.selectedSegmentIndex]
        print(total)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
}

