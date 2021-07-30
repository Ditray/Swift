//
//  AvaliableGroupsTableViewController.swift
//  Social Network
//
//  Created by Андрей Дитякин on 31.07.2021.
//

import UIKit

class AvaliableGroupsTableViewController: UITableViewController {

    //MARK: - Properties
    private var reuseID = "AvaliableGroupsTableViewCell"
    
    private var groups = [
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

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        return cell
    }

}
