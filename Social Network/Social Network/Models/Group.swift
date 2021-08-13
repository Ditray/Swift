//
//  Group.swift
//  Social Network
//
//  Created by Андрей Дитякин on 30.07.2021.
//

import UIKit
struct Group {
    let name: String
    let subscribers: Int
    let image: UIImage?
}
extension Group {
    static let allAddedGroups = [
        Group(name: "Group#1", subscribers: 43, image: UIImage(named: "Image")),
        Group(name: "Group#2", subscribers: 5254, image: UIImage(named: "Image")),
        Group(name: "Group#3", subscribers: 345, image: UIImage(named: "Image")),
        Group(name: "Group#4", subscribers: 123745, image: UIImage(named: "Image")),
        Group(name: "Group#5", subscribers: 34554, image: nil),
        Group(name: "Group#6", subscribers: 3453455, image: nil)
    ]
    static let allAvaliableGroups = [
        Group(name: "Group№1", subscribers: 43, image: UIImage(named: "Image")),
        Group(name: "Group№2", subscribers: 5254, image: UIImage(named: "Image")),
        Group(name: "Group№3", subscribers: 345, image: UIImage(named: "Image")),
        Group(name: "Group№4", subscribers: 123745, image: UIImage(named: "Image")),
        Group(name: "Group№5", subscribers: 34554, image: nil),
        Group(name: "Group№6", subscribers: 3453455, image: nil)
    ]

}
