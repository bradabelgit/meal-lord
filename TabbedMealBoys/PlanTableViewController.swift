//
//  PlanTableViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import RealmSwift

class PlanTableViewController: UITableViewController {
    
    var updateList: NotificationToken?
    let headerTitles = ["Breakfast", "Lunch", "Dinner", "Pre-Workout", "Post-Workout"]
    
    // Set up data by creating a 2-D array. And a notification that updates it every time the collection is updated. Could make a use case for the presentation
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()
        
        updateList = realm.objects(Plan).addNotificationBlock{
            results, error in
            
            self.tableView.reloadData()
        }    
        
        let nib = UINib(nibName: "TableSectionHeader", bundle: nil)
        tableView.registerNib(nib, forHeaderFooterViewReuseIdentifier: "TableSectionHeader")
        
        self.tableView.registerNib(UINib(nibName: "PlanTableViewCell", bundle: nil), forCellReuseIdentifier: "PlanTableViewCell")
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header: UITableViewHeaderFooterView = view as! UITableViewHeaderFooterView //recast your view as a UITableViewHeaderFooterView
        header.contentView.backgroundColor = UIColor(red: 0/255, green: 181/255, blue: 229/255, alpha: 1.0) //make the background color light blue
        header.textLabel!.textColor = UIColor.whiteColor() //make the text white
        header.alpha = 1 //make the header transparent
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, parentViewController!.view.frame.width, parentViewController!.view.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        let count = realm.objects(PlanNom).filter("section = \(section)");
        
        print("section = " + headerTitles[section] + " count = \(count.count)")
        
        return count.count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "PlanTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! PlanTableViewCell
        
        let nom = planMgr.plan!.noms[indexPath.row]
        
        cell.planNom = nom
        cell.nameText.text = nom.name
        cell.proteinText.text = "\(nom.servingProtein)"
        cell.carbsText.text = "\(nom.servingCarbs)"
        cell.fatText.text = "\(nom.servingFat)"

        cell.setup()
        
        print (planMgr.plan!.noms.count)
        
        return cell
    }
}
