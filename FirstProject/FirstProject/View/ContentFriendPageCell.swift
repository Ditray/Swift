//
//  ContentFriendPageCellCollectionViewCell.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 13.11.2022.
//

import UIKit

class ContentFriendPageCell: UICollectionViewCell {
    @IBOutlet var photosCV: UICollectionView!
    var countOfSections: Int = 1
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        }
}
extension ContentFriendPageCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countOfSections
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotosCellID", for: indexPath) as? PhotosCVCell else {
            preconditionFailure("PhotosCVCell cannot")
        }
        cell.photoImageView.image = UIImage.init(named: "friend")
        return cell
    }
    
    
}
