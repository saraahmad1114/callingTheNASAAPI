//
//  AsteriodTableViewController.swift
//  NASAAPI
//
//  Created by Flatiron School on 10/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AsteriodTableViewController: UITableViewController {
    
    let store = NASADataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.store.getAsteriodInformationWithCompletion("2015-09-07", endData: "2015-09-08") { (nasaArray) in
                print("THIS IS PRINTING")
                print("***************************")
                print(nasaArray)
                print("***************************")
                self.tableView.reloadData()
        }
        NSOperationQueue.mainQueue().addOperationWithBlock {
            self.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        NSOperationQueue.mainQueue().addOperationWithBlock {
           self.tableView.reloadData()
           }
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.asteriods.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("rightDetailCell", forIndexPath: indexPath)
       NSOperationQueue.mainQueue().addOperationWithBlock {
        if let unwrappedName = self.store.asteriods[indexPath.row].name {
            cell.textLabel!.text = unwrappedName
            }
            if let unwrappedMileMax = self.store.asteriods[indexPath.row].estimatedMileMax{
                cell.detailTextLabel!.text = String(unwrappedMileMax)
            }
        }
        return cell
    }
  
    



}
