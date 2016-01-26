//
//  ViewController.swift
//  Control Fun
//
//  Created by Jason P Panas on 2016-01-26.
//  Copyright © 2016 Jason P Panas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var numberField: UITextField!
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    @IBAction func onSliderChanged(sender: UISlider)
    {
        sliderLabel.text = "\(lroundf(sender.value))"
    }
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBAction func onSwitchedChanged(sender: UISwitch)
    {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    @IBAction func toggleControls(sender: UISegmentedControl) {
    }
}

