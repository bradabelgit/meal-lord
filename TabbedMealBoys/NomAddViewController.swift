//
//  NomAddViewController.swift
//  TabbedMealBoys
//
//  Created by Connor Anderson on 2016-03-01.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

class NomAddViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtCals: UITextField!
    @IBOutlet var txtPro: UITextField!
    @IBOutlet var txtCarbs: UITextField!
    @IBOutlet var txtFat: UITextField!
    @IBOutlet var txtQty: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //Clicking the Add Button
    @IBAction func btnAddTask_Click(sender:UIButton){
        taskMgr.addTask(txtName.text!, cals: txtCals.text!, pro: txtPro.text!, carbs:  txtCarbs.text!, fat:  txtFat.text!, qty: txtQty.text!);
        self.view.endEditing(true)
        txtName.text = ""
        txtCals.text = ""
        txtPro.text = ""
        txtCarbs.text = ""
        txtFat.text = ""
        txtQty.text = ""
        self.tabBarController?.selectedIndex=1;
    }
    
    // Touch outside keyboard to close keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true
    }// called when 'return' key pressed. return NO to ignore.

}