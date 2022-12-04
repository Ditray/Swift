//
//  FriendPageController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 06.11.2022.
//

import UIKit

class FriendPageController: UICollectionViewController {
    var friend: Friends?
    let photosArray: [UIImage] = [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!]
    // MARK: - Lifecycle
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      return 2
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FriendCellID", for: indexPath) as? FriendPageCell else {
            preconditionFailure("FriendPageCell cannot")
            
        }
            cell.imageOfFriend.image = friend?.image
            cell.nameOfFriend.text = "Тоже " + (friend?.name ?? "")
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ContentFriendPageID", for: indexPath) as? ContentFriendPageCell else {
                preconditionFailure("ContentFriendPageCell cannot")
            }
            return cell
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPhotos",
           let destinationVC = segue.destination as? PhotoViewController
        {
            destinationVC.photos = photosArray
        }
    }
}
