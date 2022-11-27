//
//  LikeControl.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 13.11.2022.
//

import UIKit

class LikeControl: UIControl {
    var stateTap: Bool? = false
    var counter: Int! = 0
    @IBOutlet var counterLabel:UILabel!
    @IBOutlet var likeImage: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapDone))
        addGestureRecognizer(tap)
    }
    @objc private func tapDone (_ tap: UITapGestureRecognizer) {
        stateTap?.toggle()
        if stateTap == true {
            UIView.animate(withDuration: 1) {

                self.likeImage.image = UIImage(systemName: "hand.thumbsup.fill")
            }
//            likeImage.image = UIImage(systemName: "hand.thumbsup.fill")
        counter = counter + 1
            counterLabel.text = "\(Int(counter))"
        } else {
            likeImage.image = UIImage(systemName: "hand.thumbsup")
            counter = counter - 1
            counterLabel.text = "\(Int(counter))"
        }
    }
}
