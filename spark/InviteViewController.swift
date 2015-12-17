//
//  InviteViewController.swift
//  spark
//
//  Created by Billy Shen on 16/12/2015.
//  Copyright © 2015 Billy Shen. All rights reserved.
//

import UIKit

class InviteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UISearchDisplayDelegate {
    
    @IBOutlet weak var users: UITableView!
    
    var inviteArray = [Invite]()

    
    override func viewDidLoad() {
        
        print("InviteViewController")
        super.viewDidLoad()
        
        self.inviteArray += [Invite(avatar: UIImage(), firstName: "Apple", lastName: "Apple")]
             self.inviteArray += [Invite(avatar: UIImage(), firstName: "Bpple", lastName: "Apple")]
             self.inviteArray += [Invite(avatar: UIImage(), firstName: "Cpple", lastName: "Apple")]
             self.inviteArray += [Invite(avatar: UIImage(), firstName: "Dpple", lastName: "Apple")]
    
        self.users.reloadData()
        
    }

    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.inviteArray.count
    }
    
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

            
        let cell = self.users.dequeueReusableCellWithIdentifier("cell")! as UITableViewCell
        var invite: Invite
        invite = self.inviteArray[indexPath.row]
        cell.textLabel?.text = invite.firstName
        return cell
        
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        users.deselectRowAtIndexPath(indexPath, animated: true)
        var invite: Invite
        invite = self.inviteArray[indexPath.row]
        print("invite", invite)
        
    }
    
    

    
}
