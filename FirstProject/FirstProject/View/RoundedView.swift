//
//  ImageAvatarView.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 12.11.2022.
//

import UIKit
class RoundedView: UIControl {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.cornerRadius = bounds.height/2
        layer.masksToBounds = true
        
    }
   
}
