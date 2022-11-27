//
//  FriendsCell.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 02.11.2022.
//

import UIKit

class FriendsCell: UITableViewCell {
    @IBOutlet weak var roundedView: RoundedView!
    @IBOutlet weak var shadowView: ShadowView!
    @IBOutlet weak var labelFriends: UILabel!
    @IBOutlet weak var imageFriends: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        let extractedExpr = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
        backgroundColor = extractedExpr
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
            backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }
        if selected == false {
            backgroundColor = #colorLiteral(red: 0.431372549, green: 0.431372549, blue: 0.431372549, alpha: 1)
        }
    }

}
