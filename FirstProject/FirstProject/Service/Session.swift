//
//  Session.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 30.11.2022.
//

import Foundation
class Session{
    static let shared = Session()
    private init() {}
    var userId: Int = 0
    var token: String = ""
    
    func getToken() {
        token = UUID().uuidString
    }
    
}
