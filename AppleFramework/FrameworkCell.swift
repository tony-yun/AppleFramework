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
    
    // 중요! 3열에서 4열로 변경 시 글자가 잘리는 현상 발생 해결법
    override func awakeFromNib() {
        super.awakeFromNib()
        nameLabel.numberOfLines = 1
        nameLabel.adjustsFontSizeToFitWidth = true
    }
    
    func configure(_ framework: AppleFramework) {
        thumbnailImageView.image = UIImage(named: framework.imageName)
        nameLabel.text = framework.name
    }
    
}
