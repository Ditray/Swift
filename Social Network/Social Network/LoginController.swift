//
//  ViewController.swift
//  Social Network
//
//  Created by Андрей Дитякин on 14.02.2021.
//
		
import UIKit

class LoginController: UIViewController {

    //MARK:- Properties
    @IBOutlet var loginField: UITextField!
    @IBOutlet var passwordDield: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    @IBAction func button(_ sender: UIButton) {
        performSegue(withIdentifier: "MainSegue", sender:self )
    }
    //MARK:- Main
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
            // Второе — когда она пропадает
            NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        }
    @objc func keyboardWasShown(notification: Notification) {
            
            // Получаем размер клавиатуры
            let info = notification.userInfo! as NSDictionary
            let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
            
            // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
            scrollView.contentInset = contentInsets
            scrollView.scrollIndicatorInsets = contentInsets
        }
        
        //Когда клавиатура исчезает
        @objc func keyboardWillBeHidden(notification: Notification) {
            // Устанавливаем отступ внизу UIScrollView, равный 0
            let contentInsets = UIEdgeInsets.zero
            scrollView.contentInset = contentInsets
        }
    @IBAction func viewTapped(_ sender: UITapGestureRecognizer) {
        scrollView.endEditing(true)
    }
}
