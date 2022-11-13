//
//  GroupsViewCell.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 03.11.2022.
//

import UIKit

class GroupsCell: UITableViewCell {
    
    @IBOutlet weak var imageGroup: UIImageView!
    @IBOutlet weak var nameGroup: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
