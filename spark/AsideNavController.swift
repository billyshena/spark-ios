//
//  AsideNavController.swift
//  spark
//
//  Created by Billy Shen on 03/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import Foundation

class AsideNavController: UITableViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table background color
        self.tableView.backgroundColor = UIColor(red:0.93, green:0.93, blue:0.93, alpha:1.0)
        self.tableView.tableFooterView = UIView(frame: CGRectZero)
        
        // Avatar rounded circle
        avatar.layer.borderWidth=1.0
        avatar.layer.masksToBounds = false
        avatar.layer.borderColor = UIColor.whiteColor().CGColor
        avatar.layer.cornerRadius = 56.0
        avatar.clipsToBounds = true
        
        self.navigationController?.navigationBarHidden = true
        
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