//
//  AvaliableGroupsTableViewController.swift
//  Social Network
//
//  Created by Андрей Дитякин on 31.07.2021.
//

import UIKit

class AvaliableGroupsTableViewController: UITableViewController {
    //MARK: - Outlets
    @IBOutlet var avaliableGroupsTableView: UITableView!
    

    //MARK: - Properties
    private var reuseID = "AvaliableGroupsTableViewCell"
    
     var avaliableGroups = [
        Group(name: "Group№1", subscribers: 43, image: UIImage(named: "Image")),
        Group(name: "Group№2", subscribers: 5254, image: UIImage(named: "Image")),
        Group(name: "Group№3", subscribers: 345, image: UIImage(named: "Image")),
        Group(name: "Group№4", subscribers: 123745, image: UIImage(named: "Image")),
        Group(name: "Group№5", subscribers: 34554, image: nil),
        Group(name: "Group№6", subscribers: 3453455, image: nil)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return avaliableGroups.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: reuseID, for: indexPath) as? AvaliableGroupsTableViewCell else {fatalError("Message: Error in dequeue FriendsTableViewCell")}

        cell.avaliableGroupImage.image = avaliableGroups[indexPath.row].image
        cell.avaliableGroupName.text = avaliableGroups[indexPath.row].name
        return cell
    }

}
