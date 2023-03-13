//
//  NewsResponse.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 13.03.2023.
//

import Foundation
import UIKit

class NewsResponse: Decodable {
    let response: AllNews
}
class AllNews: Decodable {
    var items = [News]()
}
class News: Decodable {
    var date = 0
    var comments = Comments()
    var likes = Likes()
    var reposts = Reposts()
    var text = ""
    let views: Views
    
}
class Comments: Decodable {
    var count = 0
}
class Likes: Decodable {
    var count = 0
    var user_likes = 0
}
class Reposts: Decodable {
    var count = 0
}
class Views: Decodable {
    var count = 0
}
