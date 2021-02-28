//
//  FriendsController.swift
//  Social Network
//
//  Created by Андрей Дитякин on 28.02.2021.
//

import UIKit

class FriendsController: UIViewController, UITableViewDataSource {
    fileprivate let friends = [
        Friend(name:"Boris"),
        Friend(name:"Andrey"),
        Friend(name:"Alexandr"),
        Friend(name:"Maxim"),
        Friend(name:"Arseniy"),
        Friend(name:"Vladimir"),
        Friend(name:"Daniil"),
        Friend(name:"Ivan"),
    ]
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendSegue",
           let senderCell = sender as? CellPrototipe,
           let cellIndexPath = tableView.indexPath(for: senderCell),
           let friendsViewController = segue.destination as? FriendViewController{
            let selectedFriend = friends[cellIndexPath.row]
            friendsViewController.displayedFriend=selectedFriend
        }
    }
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }

    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsCell", for: indexPath) as? CellPrototipe else {return UITableViewCell()}
        cell.LabelCell.text = friends[indexPath.row].name
        return cell
    }

}
