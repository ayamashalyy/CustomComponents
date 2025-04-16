//
//  AvatarGroupViewController.swift
//  CustomComponents
//
//  Created by Aya Mashaly on 16/04/2025.
//

import UIKit

class AvatarGroupViewController: UIViewController {
    
    @IBOutlet weak var usersView: AvatarGroupView?
    
    let sampleImages = [
        UIImage(named: "user1")!,
        UIImage(named: "user2")!,
        UIImage(named: "user3")!,
        UIImage(named: "user4")!,
        UIImage(named: "user5")!
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Avatar Group"
        
        setUPAvatarGroup()
    }
    
    private func setUPAvatarGroup() {
        usersView?.update(users: sampleImages, totalUsers: 300)
    }
}
