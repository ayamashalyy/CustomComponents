//
//  AvatarGroupView.swift
//  CustomComponents
//
//  Created by Aya Mashaly on 16/04/2025.
//

import Foundation
import UIKit

class AvatarGroupView: UIView {
    private let imageSize: CGFloat = 50
    private let overlapOffset: CGFloat = 10
    private let maxVisibleImages = 4
    
    private var imageViews: [UIImageView] = []
    private let countLabel = UILabel()
    
    init(users: [UIImage], totalUsers: Int) {
        super.init(frame: .zero)
        setupCountLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCountLabel()
    }
    
    func update(users: [UIImage], totalUsers: Int) {
        // 1. Remove old images
        imageViews.forEach { $0.removeFromSuperview() }
        imageViews.removeAll()
        
        countLabel.removeFromSuperview()
        
        // 2. Show visible users
        let visibleUsers = Array(users.prefix(maxVisibleImages))
        var previousImageView: UIImageView?
        
        for image in visibleUsers {
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            imageView.layer.cornerRadius = imageSize / 2
            imageView.clipsToBounds = true
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.white.cgColor
            imageView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: imageSize),
                imageView.heightAnchor.constraint(equalToConstant: imageSize),
                imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
            
            if let previous = previousImageView {
                imageView.leadingAnchor.constraint(equalTo: previous.trailingAnchor, constant: -overlapOffset).isActive = true
            } else {
                imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            }
            
            previousImageView = imageView
            imageViews.append(imageView)
        }
        
        // 3. Update +X label
        if totalUsers > visibleUsers.count {
            countLabel.text = "+\(totalUsers - visibleUsers.count)"
            addSubview(countLabel)
            
            NSLayoutConstraint.activate([
                countLabel.leadingAnchor.constraint(equalTo: previousImageView!.trailingAnchor, constant: -overlapOffset),
                countLabel.widthAnchor.constraint(equalToConstant: imageSize),
                countLabel.heightAnchor.constraint(equalToConstant: imageSize),
                countLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            ])
        }
    }
    
    private func setupCountLabel() {
        countLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        countLabel.textColor = .white
        countLabel.backgroundColor = .orange
        countLabel.textAlignment = .center
        countLabel.layer.cornerRadius = imageSize / 2
        countLabel.clipsToBounds = true
        countLabel.translatesAutoresizingMaskIntoConstraints = false
    }
}
