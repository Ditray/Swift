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
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
