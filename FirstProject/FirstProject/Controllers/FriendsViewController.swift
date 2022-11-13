//
//  FriendsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 26.10.2022.
//

import UIKit

class FriendsViewController: UITableViewController {
    let friends = [
        Friends(image: UIImage.init(named: "friend"), name:"Богдан"),
        Friends(image: UIImage.init(named: "friend"), name:"Тима"),
        Friends(image: UIImage.init(named: "friend"), name:"Сеня"),
        Friends(image: UIImage.init(named: "friend"), name:"Саня"),
        Friends(image: UIImage.init(named: "friend"), name:"Ваня"),
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoriteFriend",
           let destinationVC = segue.destination as? FriendPageController,
            let indexPath = tableView.indexPathForSelectedRow
        {
            let friend = friends[indexPath.row].name
            destinationVC.title = friend
            destinationVC.friend = friends[indexPath.row]
            
        }
    }
}
