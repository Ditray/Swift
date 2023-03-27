//
//  GroupResponse.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 24.02.2023.
//

import Foundation
import UIKit

class GroupResponse: Decodable {
    let response: AllGroups
}
class AllGroups: Decodable {
    var count = 0
    var items = [Group]()
}
class Group: Decodable {
    var id = 0
    var members_count = Int?(0)
    var description = String?("")
    var name = ""
    var photo: UIImage?
    enum CodingKeys: String, CodingKey {
        case id
        case description
        case members_count
        case name
        case photo = "photo_100"
    }
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.description = try? container.decode(String?.self, forKey: .description)
        self.members_count = try? container.decode(Int?.self, forKey: .members_count)
        self.name = try container.decode(String.self, forKey: .name)
        let photoReference = try container.decode(String.self, forKey: .photo)
        
        if let data = try? Data(contentsOf: URL(string: photoReference)!) {
            self.photo = UIImage(data: data)
        }
    }
}
