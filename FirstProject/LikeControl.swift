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
            likeImage.image = UIImage(systemName: "hand.thumbsup.fill")
            counterLabel.text = "\(Int(counter)+1)"
        } else {
            likeImage.image = UIImage(systemName: "hand.thumbsup")
            counterLabel.text = "\(Int(counter))"
        }
    }
}
