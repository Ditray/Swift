//
//  GroupsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 03.11.2022.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var groups = [Group]()
    let request = Service()
    var isSearching = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchBar.delegate = self
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsID", for: indexPath) as? GroupsCell else {
            preconditionFailure("GroupsCell cannot")
        }
            cell.nameGroup.text = groups[indexPath.row].name
            cell.imageGroup.image = groups[indexPath.row].photo

        return cell
    }

    
}

extension GroupsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.groups.removeAll()
        if  (searchText != "") && (searchText != " ") {
            request.searchGroup(q: searchText, completion: { group in
                self.groups = group.items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            })
        }
//
    }
}
