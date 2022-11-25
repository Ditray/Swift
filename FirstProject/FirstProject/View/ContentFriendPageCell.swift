//
//  ContentFriendPageCellCollectionViewCell.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 13.11.2022.
//

import UIKit

class ContentFriendPageCell: UICollectionViewCell {
    @IBOutlet weak var imageContent: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.imageContent?.layer.cornerRadius = 10
        }
    
}
