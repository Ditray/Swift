//
//  Friend.swift
//  Social Network
//
//  Created by Андрей Дитякин on 28.02.2021.
//

import UIKit

struct Friend {
    let name: String
    let avatar: UIImage?
}
extension Friend {
    static let allFriends = [
        Friend(name:"Boris",avatar: nil),
        Friend(name:"Andrey", avatar: UIImage(named: "Friend")),
        Friend(name:"Alexandr", avatar: UIImage(named: "Friend")),
        Friend(name:"Maxim", avatar: nil),
        Friend(name:"Arseniy", avatar: nil),
        Friend(name:"Vladimir", avatar: UIImage(named: "Friend")),
        Friend(name:"Daniil", avatar: UIImage(named: "Friend")),
        Friend(name:"Ivan", avatar: nil),
    ]
}
