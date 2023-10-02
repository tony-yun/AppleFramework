//
//  FrameworkCell.swift
//  AppleFramework
//
//  Created by 윤태웅 on 10/2/23.
//

import UIKit

class FrameworkCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
    
}
