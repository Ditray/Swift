//
//  ViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 19.10.2022.
//

import UIKit

class LoginViewController: UIViewController {
    let login:String = ""
    let pass:String = ""
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBAction func loginButton(_ sender: UIButton) {
        if login == loginTextField.text {
            loginTextField.backgroundColor = UIColor.green
        }
        else {
            loginTextField.backgroundColor = UIColor.gray
        }
        if pass == passwordTextField.text {
            passwordTextField.backgroundColor = UIColor.green
        }
        else {
            passwordTextField.backgroundColor = UIColor.gray
        }
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let Check = CheckUserData()
        if !Check
        { showLoginError()}
        return Check
    }
    func CheckUserData() -> Bool {
        if login == loginTextField.text && pass == passwordTextField.text
        {return true} else
        {return false}
    }
    func showLoginError() { // Создаем контроллер
    let alter = UIAlertController(title: "Ошибка", message: "Введены не верные данные пользователя", preferredStyle: .alert)
    // Создаем кнопку для UIAlertController
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil) // Добавляем кнопку на UIAlertController
    alter.addAction(action)
    // Показываем UIAlertController
    present(alter, animated: true, completion: nil) }
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//    // Когда клавиатура появляется
//    @objc func keyboardWasShown(notification: Notification) {
//            // Получаем размер клавиатуры
//    let info = notification.userInfo! as NSDictionary
//    let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
//    let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
//            // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
//    self.scrollView?.contentInset = contentInsets
//    scrollView?.scrollIndicatorInsets = contentInsets }
//        //Когда клавиатура исчезает
//    @objc func keyboardWillBeHidden(notification: Notification) { // Устанавливаем отступ внизу UIScrollView, равный 0 let contentInsets = UIEdgeInsets.zero scrollView?.contentInset = contentInsets
//    }
//    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated)
//            // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
//    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
//            // Второе — когда она пропадает
//    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
//    }


    

}

