//
//  Requests.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 23.02.2023.
//

import Foundation
import PromiseKit
import UIKit

class Service{
    private let urlSession = URLSession.shared
    func getFriends(completion: @escaping (AllFriends) -> ()) {
        var urlComponentsOfFriends = URLComponents()
        urlComponentsOfFriends.scheme = "https"
        urlComponentsOfFriends.host = "api.vk.com"
        urlComponentsOfFriends.path = "/method/friends.get"
        urlComponentsOfFriends.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.shared.token)),
            URLQueryItem(name: "fields", value: "photo_100"),
            URLQueryItem(name: "lang", value: "en"),
            URLQueryItem(name: "count", value: "100"),
            URLQueryItem(name: "v", value: "5.131")
        ]
        let request = URLRequest(url: urlComponentsOfFriends.url!)
        let task = urlSession.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            } else {
                let friends = try! JSONDecoder().decode(FriendsResponse.self, from: data!)
                completion(friends.response)
            }
        }
        task.resume()
    }
    func getGroups(completion: @escaping (AllGroups) -> ()) {
        var urlComponentsOfFriends = URLComponents()
            urlComponentsOfFriends.scheme = "https"
            urlComponentsOfFriends.host = "api.vk.com"
            urlComponentsOfFriends.path = "/method/groups.get"
            urlComponentsOfFriends.queryItems = [
                    URLQueryItem(name: "access_token", value: String(Session.shared.token)),
                    URLQueryItem(name: "extended", value: "1"),
                    URLQueryItem(name: "lang", value: "0"),
                    URLQueryItem(name: "fields", value: "city, country, place, description, wiki_page, members_count, counters, start_date, finish_date"),
                    URLQueryItem(name: "count", value: "50"),
                    URLQueryItem(name: "v", value: "5.131")
                ]
        let request = URLRequest(url: urlComponentsOfFriends.url!)
        let task = urlSession.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            } else {
                let groups = try! JSONDecoder().decode(GroupResponse.self, from: data!)
                completion(groups.response)
            }
        }

        task.resume()
    }
    func searchGroup(q:String, completion: @escaping (AllGroups) -> ())  {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/groups.search"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.shared.token)),
            URLQueryItem(name: "q", value:"\(q)" ),
            URLQueryItem(name: "v", value: "5.131")
            
        ]
        let request = URLRequest(url: urlComponents.url!)
        let task = urlSession.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            } else {
                let groups = try! JSONDecoder().decode(GroupResponse.self, from: data!)
                completion(groups.response)
            }
        }
        task.resume()
    }
    
    func getUrl() -> Promise<URL> {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/newsfeed.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.shared.token)),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "filters", value: "post")
        ]
        return Promise { resolver in
            guard let url = urlComponents.url else {
                resolver.reject("unknown" as! Error)
                return
            }
            resolver.fulfill(url)
        }
    }
    func getData(_ url: URL) -> Promise<Data> {
        return Promise { resolver in
            urlSession.dataTask(with: url) { (data, response, error) in
                guard let data = data else {
                    resolver.reject("unknown" as! Error)
                    return
                }
                resolver.fulfill(data)
            }.resume()
        }
    }
    func ParseData(_ data: Data) -> Promise<AllNews> {
        return Promise { resolver in
            do{
                let response = try JSONDecoder().decode(NewsResponse.self, from: data).response
                resolver.fulfill(response)
            } catch {
                resolver.reject("unknown" as! Error)
            }
        }
    }
    func getNews(_ items: AllNews) -> Promise<AllNews> {
        return Promise { resolver in
            resolver.fulfill(items)
        }
        
    }
    
    func refToImage (_ reference: String) -> UIImage? {
        guard let url = URL(string: reference),
              let data = try? Data(contentsOf: url) else {
            return nil
        }
        let image = UIImage(data: data)
        return image
    }
}

