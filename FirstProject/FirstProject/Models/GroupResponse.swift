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
    var description = ""
    var members_count = 0
    var name = ""
    var photo: UIImage!
    
    enum CodingKeys: String, CodingKey {
        case photo = "photo_100"
    }
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let photoReference = try container.decode(String.self, forKey: .photo)
        
        if let data = try? Data(contentsOf: URL(string: photoReference)!) {
            photo = UIImage(data: data)
        }
    }
}
