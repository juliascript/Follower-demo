//
//  FollowerCell.swift
//  Follower-demo
//
//  Created by Nikolas Burk on 15/10/16.
//  Copyright © 2016 Nikolas Burk. All rights reserved.
//

import UIKit

protocol FollowerCellDelegate: class {
    func followButtonTapped(forUser: String)
}

class FollowerCell: UITableViewCell {

  weak var delegate: FollowerCellDelegate?
  
  let isFollowingString = "You are following this user"
  let isNotFollowingString = "You are not following this user"
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var followInfoLabel: UILabel!
  @IBOutlet weak var followButton: FollowButton!
  
  var user: User! {
    didSet {
      setUIForCurrentFollowingState()
    }
  }

  @IBAction func followButtonPressed(_ sender: AnyObject) {
    print(#function)
    
    if let followButton = sender as? FollowButton {

        if followButton.followState == .isFollowing{
            delegate?.followButtonTapped(forUser: nameLabel.text!)
//            followButton.followState = .isNotFollowing
        } else {
            delegate?.followButtonTapped(forUser: nameLabel.text!)
//            followButton.followState = .isFollowing
        }
        
    }
  }
  
  func setUIForCurrentFollowingState() {
    nameLabel.text = user.name
    followInfoLabel.text = user.isFollowing ? isFollowingString : isNotFollowingString
    followButton.followState = user.isFollowing ? .isFollowing : .isNotFollowing
  }

}



