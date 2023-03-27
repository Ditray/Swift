//
//  NewsViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 25.11.2022.
//

import UIKit

class NewsViewController: UITableViewController {
    private let service = Service()
    private var photoService: PhotoService?
    var news = AllNews()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoService = PhotoService(container: tableView)
        service.getUrl()
            .then(on: .global(), service.getData(_:))
            .then(service.ParseData(_:))
            .then(service.getNews(_:))
            .done(on: .main) { news in
                self.news = news
                self.tableView.reloadData()
            }.catch { error in
                print(error)
            }
        
        tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCellID")
        tableView.register(UINib(nibName: "TextCell", bundle: nil), forCellReuseIdentifier: "TextCell")
        tableView.register(UINib(nibName: "PhotosCell", bundle: nil), forCellReuseIdentifier: "PhotosCell")
        tableView.register(UINib(nibName: "UserInfoCell", bundle: nil), forCellReuseIdentifier: "UserInfoCell")
        tableView.register(UINib(nibName: "FeedbackCell", bundle: nil), forCellReuseIdentifier: "FeedbackCell")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return news.items.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countOfRows = 4
//        if news.items[section].attachments?.isEmpty == true {
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
            cell.textField.text = news.items[indexPath.section].text
            return cell
        case 2: guard let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell") as? PhotosCell else{
            preconditionFailure("Error")
        }
            guard let urlImage = news.items[indexPath.section].attachments?.first?.photo?.sizes[4].url else {return UITableViewCell()}
            let image = photoService?.photo(atIndexpath: indexPath, byUrl: urlImage)
            cell.photo.image = image
            return cell
        case 3: guard let cell = tableView.dequeueReusableCell(withIdentifier: "FeedbackCell") as? FeedbackCell else{
            preconditionFailure("Error")
        }
            cell.counter.text = String(news.items[indexPath.section].views.count)
            cell.likeButton.titleLabel?.text = String(news.items[indexPath.section].likes.count)
            cell.shareButton.titleLabel?.text = String(news.items[indexPath.section].reposts.count)
            cell.commentButton.titleLabel?.text = String(news.items[indexPath.section].comments.count)
            return cell
        default:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "")
            return cell
        }
        
    }
}
