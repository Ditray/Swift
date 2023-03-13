//
//  News.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 25.11.2022.
//

import UIKit
class News_old{
    let avatar: UIImage?
    let name: String
    let text: String?
    let images: UIImage?
    init(avatar: UIImage? = nil, name: String, text: String, images: UIImage?) {
        self.avatar = avatar
        self.name = name
        self.text = text
        self.images = images
    }
}
