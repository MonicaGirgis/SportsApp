//
//  FavouriteSportsCustomTableViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class FavouriteSportsCustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //make image circular
        favouriteSportImg.layer.borderWidth = 1
        favouriteSportImg.layer.masksToBounds = false
        favouriteSportImg.layer.borderColor = UIColor.black.cgColor
        favouriteSportImg.layer.cornerRadius = favouriteSportImg.frame.height/2
        favouriteSportImg.clipsToBounds = true
        //view
        favouriteSportView.layer.borderWidth = 3
        favouriteSportView.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        favouriteSportView.layer.cornerRadius = 8
        favouriteSportView.layer.cornerRadius = 8
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBOutlet weak var favouriteSportView: UIView!
    
    @IBOutlet weak var favouriteSportImg: UIImageView!
    
    @IBOutlet weak var favouriteSportNameLbl: UILabel!
    
    
    @IBOutlet weak var favouriteSportLabel: UILabel!
    
}
