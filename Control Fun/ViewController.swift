//
//  ViewController.swift
//  Control Fun
//
//  Created by Jason P Panas on 2016-01-26.
//  Copyright © 2016 Jason P Panas. All rights reserved.
// smb://dmit/student
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        sliderLabel.text = "50"
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var nameField: UITextField!

    @IBOutlet weak var numberField: UITextField!
    
    @IBAction func textFieldDoneEditing(sender: UITextField)
    {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(sender: AnyObject)
    {
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
    @IBOutlet weak var doSomthingButton: UIButton!
    
    @IBAction func onSwitchedChanged(sender: UISwitch)
    {
        let setting = sender.on
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    @IBAction func toggleControls(sender: UISegmentedControl)
    {
        if sender.selectedSegmentIndex == 0  //"If the Switches is selected
        {
            leftSwitch.hidden = false
            rightSwitch.hidden = false
            doSomthingButton.hidden = true
        }
        else
        {
            leftSwitch.hidden = true
            rightSwitch.hidden = true
            doSomthingButton.hidden = false
        }
    }
    
    @IBAction func onButtonPressed(sender: UIButton)
    {
        let controller = UIAlertController(title: "Are You Sure?", message:nil, preferredStyle: .ActionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure!", style: .Destructive,
            handler: { action in let msg = self.nameField.text!.isEmpty
            ? "You can breathe easy, everything went OK."
            : "You can breathe easy, \(self.nameField.text),"
            + "everything went OK."
                
            let controller2 = UIAlertController(title:"Something Was Done", message: msg, preferredStyle: .Alert)
            
            let cancelAction = UIAlertAction(title: "Phew!", style: .Cancel, handler: nil)
            
            controller2.addAction(cancelAction)
                
            self.presentViewController(controller2, animated: true, completion: nil)
            }) //this one created yes button for action sheet (refer to page 136)
        
        let noAction = UIAlertAction(title: "No way!", style: .Cancel, handler: nil) //this created no button for action sheet
        
        controller.addAction(yesAction) // this adds the actions to the controller
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController
        {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        presentViewController(controller, animated: true, completion: nil)
    }
    
    
    
}

