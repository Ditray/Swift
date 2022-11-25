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
    var sortedFriends = [Character:[Friends]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sortedFriends = sort(friends: friends)
    }
    private func sort(friends:[Friends])-> [Character:[Friends]]{
        
        var friendsSorted = [Character:[Friends]]()
        
        friends.forEach(){ friend in
            
            guard let firstChar = friend.name?.first else {return}
            
            if var thisCharFriends = friendsSorted[firstChar] {
                thisCharFriends.append(friend)
                friendsSorted[firstChar] = thisCharFriends
            } else {
                friendsSorted[firstChar] = [friend]
            }
        }
        return friendsSorted
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
        
        let friend: Friends = friends[indexPath.row]
        
        cell.labelFriends.text = friend.name
        cell.imageFriends.image = friend.image
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
            let indexPath = tableView.indexPathForSelectedRow
        {
            let friend = friends[indexPath.row].name
            destinationVC.title = friend
            destinationVC.friend = friends[indexPath.row]
            
        }
    }
}
