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
        
        updateList = realm.objects(Nom).addNotificationBlock {
            results, error in
            
            self.tableView.reloadData()
        }
        
        self.tableView.registerNib(UINib(nibName: "NomsTableViewCell", bundle: nil), forCellReuseIdentifier: "NomsTableViewCell")
    }
    
    override func viewDidLayoutSubviews() {
        self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y, parentViewController!.view.frame.width, parentViewController!.view.frame.height)
        
        self.tableView.contentInset = UIEdgeInsetsMake(self.view.frame.height * 0.125, 0, 0, 0)
        
        let label = UILabel(frame: CGRectMake(0, -200, self.view.frame.width, self.view.frame.height * 0.125))
        label.center = CGPointMake(self.view.frame.width/2, -((self.view.frame.height * 0.125)/2))
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
        cell.proteinText.text = "\(Int(nom.servingProtein))"
        cell.carbText.text = "\(Int(nom.servingCarbs))"
        cell.fatText.text = "\(Int(nom.servingFat))"
        cell.gramText.text = "/\(Int(nom.servingSizeGrams))"
        cell.nom = nom
        
        cell.masterViewController = parentViewController as? MasterViewController
        
        return cell
    }
}
