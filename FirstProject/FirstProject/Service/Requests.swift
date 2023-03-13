//
//  Requests.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 23.02.2023.
//

import Foundation

class Requests{
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
        let urlSession = URLSession.shared
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
        let urlSession = URLSession.shared
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
        let urlSession = URLSession.shared
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
    func getNews(completion: @escaping (AllNews) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.vk.com"
        urlComponents.path = "/method/newsfeed.get"
        urlComponents.queryItems = [
            URLQueryItem(name: "access_token", value: String(Session.shared.token)),
            URLQueryItem(name: "v", value: "5.131"),
            URLQueryItem(name: "filters", value: "post")
        ]
        let request = URLRequest(url: urlComponents.url!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: request) { (data, response, error) -> Void in
            if let error = error {
                print(error)
                return
            } else {
                let news = try! JSONDecoder().decode(NewsResponse.self, from: data!)
                completion(news.response)
            }
        }
        task.resume()
    }
}
