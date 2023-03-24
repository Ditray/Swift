//
//  MyGroupsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 03.11.2022.
//

import UIKit
import Alamofire
import Foundation

class MyGroupsViewController: UITableViewController {
    private let queue = OperationQueue()
    var groups = [Group]()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        let request = AF.request("https://api.vk.com/method/groups.get?access_token=vk1.a.7ECQlbhdb5CgMrOJVO6DwkgHR-dntYj842dJnpg7jnMV2lzou5C9O-RRflr1SH2de3UsmO4MrQs7athK7lkuJKbAAsWCrxemQDYEeOOUoFthbtjRxvjMphtrMHEX3vl1Vwt0Ls-MVcb_IFtE4Y5qb3VhnFjO-rJUX62J8qSJUhRFryS2Biq31SZ6CEX4MVacGMS4fcFehfrnpvZIqtGmrA&extended=1&lang=0&fields=city,country,place,description,wiki_page,members_count,counters,start_date,finish_date&v=5.131&count=50")
        let getDataOperation = GetDataOperation(request: request)
        queue.addOperation(getDataOperation)
        getDataOperation.completionBlock = {
            print(getDataOperation.data)
        }
        let parseData = ParseGroupResponseData()
        parseData.addDependency(getDataOperation)
        queue.addOperation(parseData)
        let reloadTableView = ReloadTableController(controller: self)
        reloadTableView.addDependency(parseData)
        OperationQueue.main.addOperation(reloadTableView)
    }
    
    @IBAction func addGroup(segue: UIStoryboardSegue) {
        if segue.identifier == "addGroup" {
            guard let GroupsViewController = segue.source as? GroupsViewController else {return}
            if let indexPath = GroupsViewController.tableView.indexPathForSelectedRow {
                let group = GroupsViewController.groups[indexPath.row]
                if !groups.contains(where: {$0.name == group.name})  {
                    groups.append(group)
                    tableView.reloadData()
                }
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return groups.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyGroupsID", for: indexPath) as? MyGroupsCell else {
            preconditionFailure("MyGroupsCell cannot")
        }
        cell.nameGroup.text = groups[indexPath.row].name
        cell.imageGroup.image = groups[indexPath.row].photo
        cell.descriptionGroup.text = groups[indexPath.row].description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {

        }    
    }
    
   }
