//
//  ShadowView.swift
//  Social Network
//
//  Created by Андрей Дитякин on 05.08.2021.
//

import UIKit

class ShadowView: UIView {
    //MARK: - Properties
    @IBInspectable var shadowColor: UIColor = UIColor.black {
        didSet {
            self.updateColor()
        }
    }
        @IBInspectable var shadowOpacity: Float = 0.5 {
        didSet {
            self.updateOpacity()
        }
        }
            @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            self.updateRadius()
        }
            }
    
    //MARK: - Functions
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = self.frame.height/2
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowRadius = shadowRadius
        layer.shadowOffset = CGSize.zero
        layer.masksToBounds = false
        
    }
    //MARK:- Configuring methods
    func updateColor() {
        layer.shadowColor = shadowColor.cgColor
    }
    
    func updateOpacity() {
        layer.shadowOpacity = shadowOpacity
    }
    
    func updateRadius() {
        layer.shadowRadius = shadowRadius
    }
}
