//
//  FriendsCell.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 02.11.2022.
//

import UIKit

class FriendsCell: UITableViewCell {
    @IBOutlet weak var labelFriends: UILabel!
    @IBOutlet weak var imageFriends: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 30
        backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected == true{
            backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        }
        if selected == false {
            backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        }
    }

}
