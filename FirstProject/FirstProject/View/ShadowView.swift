//
//  AvatarControl.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 12.11.2022.
//

import UIKit
class ShadowView: UIControl {
    @IBInspectable var shadowRadius: CGFloat = 7
    @IBInspectable var shadowOpacity: Float = 0.7
    @IBInspectable var shadowColor: UIColor = UIColor.black
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        layer.shadowColor = shadowColor.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = CGSize.zero
        layer.shadowPath = CGPath(roundedRect: bounds, cornerWidth: bounds.width, cornerHeight: bounds.height, transform: nil)
        
    }

}
