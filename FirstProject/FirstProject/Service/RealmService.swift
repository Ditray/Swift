//
//  RealmService.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 25.03.2023.
//

import Foundation
import RealmSwift
class RealmService {
    func saveFriendsData(_ friends: [Friend]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(friends)
            try realm.commitWrite()
        } catch {
            print(error)
        }
    }
}
