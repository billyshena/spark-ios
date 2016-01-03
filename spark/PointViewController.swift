//
//  PointViewController.swift
//  spark
//
//  Created by Billy Shen on 30/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit


class PointViewController: UITableViewController {
    
    
    
    @IBOutlet weak var doneButton: UIBarButtonItem!
    struct Items{
        var sectionName : String!
        var sectionItems: [String]!
    }
    
    var itemsArray = [Items]()
    
    var deckNames = [ "Music", "Sports", "Travel", "Culture", "Food", "History", "Sex", "Nature"]
    var questions = [
        "What traits describe you the best?",
        "What traits describe you the best?"
    ]
    
    
    @IBAction func donePressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
   
        print("PointViewController")
        itemsArray = [
            Items(sectionName: "DECEMBER 2015", sectionItems: ["Test1", "Test2","Test1", "Test2","Test1", "Test2"] ),
            Items(sectionName: "SEPTEMBER 2015", sectionItems: ["Test1", "Test2"] ),
            Items(sectionName: "JULY 2015", sectionItems: ["Test1", "Test2"] ),
            Items(sectionName: "FEBRUARY 2015", sectionItems: ["Test1", "Test2","Test1", "Test2","Test1", "Test2","Test1", "Test2"] )
        ]
        
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        self.tableView.rowHeight = 80.0
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsArray[section].sectionItems.count
        
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return itemsArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! PointViewCell!
        cell.deckName?.text = "Music"
        cell.pointImage?.layer.cornerRadius = (cell.pointImage?.frame.size.width)! / 2
        cell.pointImage?.clipsToBounds = true
        cell.question?.text = "What traits describe you the best?"
        return cell
        
    }
    
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return itemsArray[section].sectionName
        
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 40
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        header.textLabel!.font = UIFont(name: "Helvetica Neue", size: 12)
        header.textLabel!.textColor = UIColor.lightGrayColor()
    }


    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
        
        if cell.respondsToSelector("setSeparatorInset:") {
            cell.separatorInset = UIEdgeInsetsZero
        }
        if cell.respondsToSelector("setLayoutMargins:") {
            cell.layoutMargins = UIEdgeInsetsZero
        }
        if cell.respondsToSelector("setPreservesSuperviewLayoutMargins:") {
            cell.preservesSuperviewLayoutMargins = false
        }
        
    }
}


    
    
    
