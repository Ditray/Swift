//
//  PhotosCell.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 09.03.2023.
//

import UIKit

class PhotosCell: UITableViewCell {

    @IBOutlet var photo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
