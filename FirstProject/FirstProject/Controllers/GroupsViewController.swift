//
//  GroupsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 03.11.2022.
//

import UIKit

class GroupsViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    let groups = [Group]()
    var filteredGroups = [Group]()
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
        if isSearching {
            return filteredGroups.count
        } else {
            return groups.count
        }
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsID", for: indexPath) as? GroupsCell else {
            preconditionFailure("GroupsCell cannot")
        }
        if isSearching {
            cell.nameGroup.text = filteredGroups[indexPath.row].name
            cell.imageGroup.image = filteredGroups[indexPath.row].photo
        } else {
            cell.nameGroup.text = groups[indexPath.row].name
            cell.imageGroup.image = groups[indexPath.row].photo
        }
        
        return cell
    }

    
}

extension GroupsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filteredGroups.removeAll()
        guard searchText != "" || searchText != " " else {
            print("Empty Search")
            return
        }
        searchGroup(q: searchText)
        for item in groups {
            let text = searchText.lowercased()
            let isArrayContain = item.name.lowercased().ranges(of: text)
            if isArrayContain.count > 0{
                filteredGroups.append(item)
            }
        }
        if searchBar.text == "" {
            isSearching = false
            tableView.reloadData()
        } else {
            isSearching = true
            tableView.reloadData()
        }
    }
    
    func searchGroup(q:String)  {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.shared.token)),
            URLQueryItem(name: "q", value:"\(q)" ),
            URLQueryItem(name: "v", value: "5.131")
            
        ]
        let request = URLRequest(url: urlComponents.url!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            } else {
                let json = try? JSONSerialization.jsonObject(with: data!, options: .fragmentsAllowed)
                print(json)
            }
        }
        task.resume()
    }
}
