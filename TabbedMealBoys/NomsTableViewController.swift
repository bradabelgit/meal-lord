//
//  NomsTableViewController.swift
//  TabbedMealBoys
//
//  Created by Bradley Abel on 2016-03-16.
//  Copyright © 2016 Connor Anderson. All rights reserved.
//

import UIKit
import RealmSwift

class NomsTableViewController: UITableViewController {
    
    var noms: Results<Nom>?
    var updateList: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let realm = try! Realm()

        let nomsQuery = realm.objects(Nom)
        noms = nomsQuery
        
        self.tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0)
        
        updateList = realm.objects(Nom).addNotificationBlock {
            results, error in
            
            self.tableView.reloadData()
        }
        
        self.tableView.registerNib(UINib(nibName: "NomsTableViewCell", bundle: nil), forCellReuseIdentifier: "NomsTableViewCell")
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, parentViewController!.view.frame.width, parentViewController!.view.frame.height)
        
        let label = UILabel(frame: CGRectMake(0, 0, self.view.frame.width, 70))
        label.center = CGPointMake(self.view.frame.width/2, -20)
        label.textAlignment = NSTextAlignment.Center
        label.text = "NOMS"
        label.font = label.font.fontWithSize(30)
        label.textColor = UIColor.whiteColor()
        self.view.addSubview(label)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        
        noms = realm.objects(Nom)
        
        return noms!.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "NomsTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as!NomsTableViewCell
        
        let nom = noms![indexPath.row]                        
        
        cell.nameText.text = nom.name        
        cell.proteinText.text = "\(nom.servingProtein)"
        cell.carbText.text = "\(nom.servingCarbs)"
        cell.fatText.text = "\(nom.servingFat)"
        cell.nom = nom
        
        cell.masterViewController = parentViewController as? MasterViewController
        
        return cell
    }
}
