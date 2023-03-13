//
//  NewsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 25.11.2022.
//

import UIKit

class NewsViewController: UITableViewController {
//    let news = [
//        News_old(avatar:UIImage(named: "friend"), name: "Петр", text: "Все заголовки в навигаторе поиска Xcode могут быть изменены: Find можно «Заменить», Text может быть ссылкой или регулярным выражением, а Containing может быть сопоставлением, запуском и т. д. Вы также можете щелкнуть увеличительное стекло, чтобы просмотреть недавние поисковые запросы — при выборе одного из них он повторяется.", images: UIImage(named: "1"))
//    ]
    let request = Requests()
    var news = [News]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            self.request.getNews { response in
                self.news = response.items
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
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
//        if news[section]. == nil {
//            countOfRows -= 1
//        }
        return countOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0: guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserInfoCell") as? UserInfoCell else{
            preconditionFailure("Error")
        }
            cell.labelView.text = "Test"
            cell.avatharView.image = UIImage(named: "1")
            return cell
        case 1: guard let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell") as? TextCell else{
            preconditionFailure("Error")
        }
            cell.textField.text = news[indexPath.section].text
            return cell
        case 2: guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell") as? PhotosCell else{
            preconditionFailure("Error")
        }
            cell.photo.image = UIImage(named: "1")
            return cell
        case 3: guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell") as? FeedbackCell else{
            preconditionFailure("Error")
        }
            cell.counter.text = String(news[indexPath.section].views.count)
            cell.likeButton.titleLabel?.text = String(news[indexPath.section].likes.count)
            cell.shareButton.titleLabel?.text = String(news[indexPath.section].reposts.count)
            cell.commentButton.titleLabel?.text = String(news[indexPath.section].comments.count)
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "")
            return cell
        }
        
    }
}
