//
//  ImageAvatarView.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 12.11.2022.
//

import UIKit
class RoundedView: UIControl {
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
    @objc private func tapDone() {
        UIView.animate(withDuration: 0.2) {
            self.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }
        UIView.animate(withDuration: 0.5,
                       delay: 0.2,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 1) {
            self.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height/2
        layer.masksToBounds = true
        
    }
   
}
