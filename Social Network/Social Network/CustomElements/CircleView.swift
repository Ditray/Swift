//
//  Circle.swift
//  Social Network
//
//  Created by Андрей Дитякин on 05.08.2021.
//

import UIKit

class CircleView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.height/2
        layer.masksToBounds = true
    }

    
}
