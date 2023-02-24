//
//  FriendsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 26.10.2022.
//

import UIKit

class FriendsViewController: UITableViewController {
    
    var sortedFriends = [Character:[Friend]]()
    var friends = [Friend]()
    let request = Requests()
    var count = 0
    private func sort(friends:[Friend])-> [Character:[Friend]]{
        
        var friendsSorted = [Character:[Friend]]()
        friends.forEach(){ friend in
            
            guard let firstChar = friend.lastName.first else {return}
            
            if var thisCharFriends = friendsSorted[firstChar] {
                thisCharFriends.append(friend)
                friendsSorted[firstChar] = thisCharFriends
            } else {
                friendsSorted[firstChar] = [friend]
            }
        }

        return friendsSorted
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        request.getFriends { friends in
            self.friends = friends.items
            self.count = friends.count
            self.sortedFriends = self.sort(friends: self.friends)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sortedFriends.keys.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let keySorted = sortedFriends.keys.sorted()
        let friends = sortedFriends[keySorted[section]]?.count ?? 0
        return friends
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        let header = String(sortedFriends.keys.sorted()[section])
        return header
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "firstCellPrototipe", for: indexPath) as? FriendsCell else {
            preconditionFailure("FriendCell cannot")
        }
        let firstChar = sortedFriends.keys.sorted()[indexPath.section]
        let friends = sortedFriends[firstChar]!
        
        let friend: Friend = friends[indexPath.row]
        cell.labelFriends.text = friend.lastName + " " + friend.firstName
        cell.imageFriends.image = friend.photo
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        let header = view as! UITableViewHeaderFooterView
        header.tintColor = .darkGray
        header.textLabel?.textColor = .black
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var arrayOfIndexes:[String] = [""]
        for index in sortedFriends.keys {
            arrayOfIndexes.append(String(index))
        }
        return arrayOfIndexes
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "favoriteFriend",
           let destinationVC = segue.destination as? FriendPageController,
           let section = tableView.indexPathForSelectedRow?.section,
           let indexPath = tableView.indexPathForSelectedRow
        {
            let keySorted = sortedFriends.keys.sorted()
            let friends = sortedFriends[keySorted[section]]
            let friend: Friend? = friends?[indexPath.row]
            destinationVC.friend = friend
            
        }
    }
}
