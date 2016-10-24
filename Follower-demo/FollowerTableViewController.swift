//
//  FollowerTableViewController.swift
//  Follower-demo
//
//  Created by Nikolas Burk on 15/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit
 

class FollowerTableViewController: UITableViewController, FollowerCellDelegate {
  
  var users: [User] =  [
    User(name: "John", isFollowing: false),
    User(name: "Carl", isFollowing: false),
    User(name: "Michael", isFollowing: false),
    User(name: "Scott", isFollowing: false),
    User(name: "Jenny", isFollowing: false),
    User(name: "Marina", isFollowing: false),
    User(name: "Sarah", isFollowing: false),
    User(name: "Wendy", isFollowing: false),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    title = "Following"
  }
    
    func followButtonTapped(forUser: String) {
        
        
        for var i in 0..<users.count{
            if users[i].name == forUser{
                if users[i].isFollowing{
                    users[i].isFollowing = false
                    tableView.reloadData()
                    break
                } else {
                    users[i].isFollowing = true
                    tableView.reloadData()
                    break
                }
                
            }
            
        }
    }
  
  
  // MARK: - Table view data source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return users.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "FollowerCell") as! FollowerCell
    cell.user = users[indexPath.row]
    cell.delegate = self
    return cell
  }

}
