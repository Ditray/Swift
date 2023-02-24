//
//  MyGroupsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 03.11.2022.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    
    var groups = [Group]()
    let request = Requests()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        request.getGroups { groups in
            self.count = groups.count
            self.groups = groups.items
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
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
