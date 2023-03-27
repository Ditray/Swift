//
//  AnimViewController.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 27.11.2022.
//

import UIKit

class AnimViewController: UIViewController {
    @IBAction func button(_ sender: Any) {
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.repeat,.autoreverse]) {
            self.loading1.alpha = 0
        }
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       options: [.repeat,.autoreverse]) {
            self.loading2.alpha = 0
        }
        UIView.animate(withDuration: 0.5,
                       delay: 0.4,
                       options: [.repeat,.autoreverse]) {
            self.loading3.alpha = 0
        }
        
    }
    @IBOutlet  var loading1: UIView!
    
    @IBOutlet var loading3: UIView!
    @IBOutlet var loading2: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
