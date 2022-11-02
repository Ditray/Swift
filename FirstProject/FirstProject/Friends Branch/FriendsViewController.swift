//
//  FriendsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 26.10.2022.
//

import UIKit

class FriendsViewController: UITableViewController {
    let friends = [
        Friends(image: UIImage.init(systemName: "paperplane.fill"), name:"Богдан"),
        Friends(name:"Тима"),
        Friends(name:"Сеня"),
        Friends(name:"Саня"),
        Friends(name:"Ваня"),
    ]
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCellPrototipe", for: indexPath) as? FriendsCell else {
            preconditionFailure("FriendCell cannot")
        }
        cell.labelFriends.text = friends[indexPath.row].name
        cell.imageFriends.image = friends[indexPath.row].image
        return cell
    }
}
