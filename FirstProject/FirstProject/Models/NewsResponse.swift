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
    var profiles = [Profiles]()
}
class News: Decodable {
    var date = 0
    var source_id = 0
    var comments = Comments()
    var likes = Likes()
    var reposts = Reposts()
    var text = ""
    let views: Views
    var attachments: [Attachments]?
    
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
class Attachments: Decodable {
    var type = ""
    var photo: Photo?
}
class Photo: Decodable {
    var id = 0
    let sizes: [Sizes]
}
class Sizes: Decodable {
    var height = 0
    var type = ""
    var width = 0
    var url = ""
}
class Profiles: Decodable {
    var id = 0
    var first_name: String?
    var last_name: String?
    var name: String?
    var photo_100 = ""
    
}
