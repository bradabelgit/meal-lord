//
//  NomAddViewController.swift
//  TabbedMealBoys
//
//  Created by Connor Anderson on 2016-03-01.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import TextFieldEffects

class NomAddViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet weak var txtName: KaedeTextField!
    @IBOutlet weak var txtCals: KaedeTextField!
    @IBOutlet weak var txtProtein: KaedeTextField!
    @IBOutlet weak var txtCarb: KaedeTextField!
    @IBOutlet weak var txtFat: KaedeTextField!
    @IBOutlet weak var txtSize: KaedeTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //Clicking the Add Button
    
    @IBAction func btnAddTask_Click(sender:UIButton){
        taskMgr.addTask(txtName.text!, cals: txtCals.text!, pro: txtProtein.text!, carbs:  txtCarb.text!, fat:  txtFat.text!, qty: txtSize.text!);
//        nomsManager.addNoms(Nom(txtName.text!, txtCals.text, txtProtein.text, txtCarb.text, txtFat.text, txtSize.text))        
        
        self.view.endEditing(true)
        
        txtName.text = ""
        txtCals.text = ""
        txtCarb.text = ""
        txtFat.text = ""
        txtProtein.text = ""
        txtSize.text = ""
        
        self.tabBarController?.selectedIndex=1;
    }
    
    // Touch outside keyboard to close keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    // called when 'return' key pressed. return NO to ignore.
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true
    }
}