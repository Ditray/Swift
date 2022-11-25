//
//  News.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 25.11.2022.
//

import UIKit
class News{
    let avatar: UIImage?
    let name: String
    let text: String
    let images: Any
    init(avatar: UIImage? = nil, name: String, text: String, images: Any) {
        self.avatar = avatar
        self.name = name
        self.text = text
        self.images = images
    }
}
