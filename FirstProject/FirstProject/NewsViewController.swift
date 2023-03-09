//
//  NewsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 25.11.2022.
//

import UIKit

class NewsViewController: UITableViewController {
    @IBAction func like(_ sender: UIButton) {
        if sender.isSelected == true {
            sender.titleLabel?.text = "1"
            sender.backgroundColor = .blue
        } else {
            sender.titleLabel?.text = "0"
        }
    }
    let news = [
        News(avatar:UIImage(named: "friend"), name: "Петр", text: "Все заголовки в навигаторе поиска Xcode могут быть изменены: Find можно «Заменить», Text может быть ссылкой или регулярным выражением, а Containing может быть сопоставлением, запуском и т. д. Вы также можете щелкнуть увеличительное стекло, чтобы просмотреть недавние поисковые запросы — при выборе одного из них он повторяется.", images: UIImage(named: "1"))
    ]
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCellID")
        tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
        tableView.register(UINib(nibName: "PhotosCell", bundle: nil), forCellReuseIdentifier: "PhotosCell")
        tableView.register(UINib(nibName: "UserInfoCell", bundle: nil), forCellReuseIdentifier: "UserInfoCell")
        tableView.register(UINib(nibName: "FeedbackCell", bundle: nil), forCellReuseIdentifier: "FeedbackCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = 4
        if news[section].images == nil {
            countOfRows -= 1
        }
        return countOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as? UserInfoCell else{
            preconditionFailure("Error")
        }
            cell.labelView.text = news[indexPath.section].name
            cell.avatharView.image = news[indexPath.section].avatar
            return cell
        case 1: guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as? TextCell else{
            preconditionFailure("Error")
        }
            cell.textField.text = news[indexPath.section].text
            return cell
        case 2: guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell") as? PhotosCell else{
            preconditionFailure("Error")
        }
            cell.photo.image = news[indexPath.section].images
            return cell
        case 3: guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell") as? FeedbackCell else{
            preconditionFailure("Error")
        }
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "")
            return cell
        }
        
    }
}
