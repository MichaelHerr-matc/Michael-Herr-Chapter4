//
//  ViewController.swift
//  ControlFun
//
//  Created by Michael Her on 10/10/19.
//  Copyright © 2019 Michael Her. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var numberField: UITextField!
    
    
    @IBOutlet weak var sliderLabel: UILabel!
    
    
    @IBOutlet weak var leftSwitch: UISwitch!
    
    
    @IBOutlet weak var rightSwitch: UISwitch!


    @IBOutlet weak var doSomethingButton: UIButton!
    
    
    @IBAction func onButtonPressed(_ sender: UIButton) {
        let controller = UIAlertController(title: "Are You Sure?", message: nil, preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes, I'm sure!", style: .destructive, handler: { action in let msg = self.nameField.text!.isEmpty
            ? "You can breathe easy, everthing went ok."
            : "You can breathe easy, \(self.nameField.text),"
            + "everything went ok."
            
            let controller2 = UIAlertController(title: "Something was done", message: msg, preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Phew!", style: .cancel, handler: nil)
            controller2.addAction(cancelAction)
            self.present(controller2, animated: true, completion: nil)
        })
        
        let noAction = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
        
        controller.addAction(yesAction)
        controller.addAction(noAction)
        
        if let ppc = controller.popoverPresentationController {
            ppc.sourceView = sender
            ppc.sourceRect = sender.bounds
        }
        
        present(controller, animated: true, completion: nil)
    }
    
    
    @IBAction func textFieldDoneEditing(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    @IBAction func onTapGestureRecognized(sender: AnyObject) {
        nameField.resignFirstResponder()
        numberField.resignFirstResponder()
    }
    
    @IBAction func onSilderChanged(_ sender: UISlider) {
        sliderLabel.text = "\(roundf(sender.value))"
    }

    
    @IBAction func onSwitchChanged(_ sender: UISwitch) {
        let setting = sender.isOn
        leftSwitch.setOn(setting, animated: true)
        rightSwitch.setOn(setting, animated: true)
    }
    
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 { // "Switches" is selected
            leftSwitch.isHidden = false
            rightSwitch.isHidden = false
            doSomethingButton.isHidden = true
        } else {
            leftSwitch.isHidden = true
            rightSwitch.isHidden = true
            doSomethingButton.isHidden = false
            
        }
    }
    
    
    override func viewDidLoad() {
        sliderLabel.text = "50"
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

