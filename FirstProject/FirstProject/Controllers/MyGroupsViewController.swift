//
//  MyGroupsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 03.11.2022.
//

import UIKit

class MyGroupsViewController: UITableViewController {
    var groups = [
        Groups(image: UIImage.init(systemName: "paperplane.fill"), name: "подслушка"),
        Groups(image: UIImage.init(systemName: "paperplane.fill"), name: "учеба"),
        Groups(image: UIImage.init(systemName: "paperplane.fill"), name: "девайсы"),
        Groups(image: UIImage.init(systemName: "paperplane.fill"), name: "работа"),
        Groups(image: UIImage.init(systemName: "paperplane.fill"), name: "семья"),
        Groups(image: UIImage.init(systemName: "paperplane.fill"), name: "приколы")
        ]
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
        cell.imageGroup.image = groups[indexPath.row].image
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            groups.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {

        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
