//
//  NewsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 25.11.2022.
//

import UIKit

class NewsViewController: UITableViewController {
    let news = [
        News(avatar:UIImage(named: "friend"), name: "Петр", text: "Все заголовки в навигаторе поиска Xcode могут быть изменены: Find можно «Заменить», Text может быть ссылкой или регулярным выражением, а Containing может быть сопоставлением, запуском и т. д. Вы также можете щелкнуть увеличительное стекло, чтобы просмотреть недавние поисковые запросы — при выборе одного из них он повторяется.", images: [UIImage(named: "1"), UIImage(named: "2")])
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCellID")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCellID", for: indexPath) as? NewsViewCell else{
            preconditionFailure("Error")
        }

        cell.nameLabel.text = news[indexPath.row].name
        cell.avatarView.image = news[indexPath.row].avatar
        cell.contentLabel.text = news[indexPath.row].text
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
