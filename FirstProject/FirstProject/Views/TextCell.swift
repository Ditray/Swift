//
//  TextCell.swift
//  FirstProject
//
//  Created by Андрей Дитякин on 09.03.2023.
//

import UIKit

class TextCell: UITableViewCell {
    @IBOutlet var textField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
