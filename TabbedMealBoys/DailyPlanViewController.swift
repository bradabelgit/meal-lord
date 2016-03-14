//
//  SecondViewController.swift
//  TabbedMealBoys
//
//  Created by Connor Anderson on 2016-03-01.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit

class DailyPlanViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tblTasks: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //Length of table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return taskMgr.tasks.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        
        //*****
        cell.textLabel?.text = taskMgr.tasks[indexPath.row].name + "  (" + taskMgr.tasks[indexPath.row].qty + "g)"
        cell.detailTextLabel?.text = taskMgr.tasks[indexPath.row].cals + " Kcals - " + taskMgr.tasks[indexPath.row].pro + "g Protein - " + taskMgr.tasks[indexPath.row].carbs + "g Carbs - " + taskMgr.tasks[indexPath.row].fat + "g Fat";
        //*****
    
        return cell
    }
    
    // Returning to this view
    override func viewWillAppear(animated: Bool) {
        tblTasks.reloadData()
    }
    
    
    //UI Table View Delete
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        //Delete this Task
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            taskMgr.tasks.removeAtIndex(indexPath.row)
            tblTasks.reloadData();
        }
    }
    
}