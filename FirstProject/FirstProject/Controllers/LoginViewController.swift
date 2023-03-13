//
//  ViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 19.10.2022.
//

import UIKit
import WebKit

final class LoginViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        
        configureView()
        loadAuth()
    }
}
extension LoginViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
                guard
            let url = navigationResponse.response.url,
            url.path == "/blank.html",
            let fragment = url.fragment() else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        if let token = params["access_token"], let id = params["user_id"] {
            Session.shared.userId = Int(id)!
            Session.shared.token = token
            decisionHandler(.cancel)
            let vc = (storyboard?.instantiateViewController(withIdentifier: "TabBar"))!
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
 private extension LoginViewController {
    
     func configureView() {
         
         webView.navigationDelegate = self
     }
     
     func loadAuth() {
         
         var urlComponents = URLComponents()
                 urlComponents.scheme = "https"
                 urlComponents.host = "oauth.vk.com"
                 urlComponents.path = "/authorize"
                 urlComponents.queryItems = [
                     URLQueryItem(name: "client_id", value: "51508114"),
                     URLQueryItem(name: "display", value: "mobile"),
                     URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                     URLQueryItem(name: "scope", value: "offline, friends, photos, groups, wall"),
                     URLQueryItem(name: "response_type", value: "token"),
                     URLQueryItem(name: "revoke", value: "0")
                 ]
                 
                 let request = URLRequest(url: urlComponents.url!)
                 webView.load(request)
         


     }
}

