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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getGroups()
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
    func getGroups() {
        var urlComponentsOfFriends = URLComponents()
            urlComponentsOfFriends.scheme = "https"
            urlComponentsOfFriends.host = "api.vk.com"
            urlComponentsOfFriends.path = "/method/groups.get"
            urlComponentsOfFriends.queryItems = [
                    URLQueryItem(name: "access_token", value: String(Session.shared.token)),
                    URLQueryItem(name: "extended", value: "1"),
                    URLQueryItem(name: "lang", value: "0"),
                    URLQueryItem(name: "fields", value: "city, country, place, description, wiki_page, members_count, counters, start_date, finish_date"),
                    URLQueryItem(name: "count", value: "50"),
                    URLQueryItem(name: "v", value: "5.81")
                ]
        let request = URLRequest(url: urlComponentsOfFriends.url!)
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
