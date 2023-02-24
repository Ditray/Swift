//
//  GroupResponse.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 23.02.2023.
//

import Foundation
import UIKit

class FriendsResponse: Decodable {
    let response: AllFriends
}
class AllFriends: Decodable {
    var count = 0
    var items = [Friend]()
}
class Friend: Decodable {
    var id = 0
    var photo: UIImage!
    var firstName = ""
    var lastName = ""
    enum FriendKeys: String, CodingKey {
        case id
        case photo = "photo_100"
        case firstName = "first_name"
        case lastName = "last_name"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: FriendKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        let photoReference = try container.decode(String.self, forKey: .photo)
        
        if let data = try? Data(contentsOf: URL(string: photoReference)!) {
            photo = UIImage(data: data)
        }
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
    }
}
