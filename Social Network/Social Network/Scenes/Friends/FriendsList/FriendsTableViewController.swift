

import UIKit
class FriendsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK: - Outlets
    // таблица с друзьями
    @IBOutlet var tableView: UITableView!
    
    private var reuseID = "FriendsTableViewCell"
    //MARK: - Properties
    private var friends = [
        Friend(name:"Boris",avatar: nil),
        Friend(name:"Andrey", avatar: UIImage(named: "Friend")),
        Friend(name:"Alexandr", avatar: UIImage(named: "Friend")),
        Friend(name:"Maxim", avatar: nil),
        Friend(name:"Arseniy", avatar: nil),
        Friend(name:"Vladimir", avatar: UIImage(named: "Friend")),
        Friend(name:"Daniil", avatar: UIImage(named: "Friend")),
        Friend(name:"Ivan", avatar: nil),
    ]
    //MARK: - Functions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FriendSegue",
           let senderCell = sender as? FriendsTableViewCell,
           let cellIndexPath = tableView.indexPath(for: senderCell),
           let friendsViewController = segue.destination as? FriendsCollectionViewController{
            let selectedFriend = friends[cellIndexPath.row]
            friendsViewController.displayedFriend = selectedFriend
        }
    }
    // MARK: - Table view data source

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return friends.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? FriendsTableViewCell else {fatalError("Message: Error in dequeue FriendsTableViewCell")}
        cell.friendName.text = friends[indexPath.row].name
        cell.friendImage.image = friends[indexPath.row].avatar
        return cell
    }

}
