//
//  teamImagesCollectionViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/24/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class teamImagesCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        teamImg.layer.borderWidth = 1
        teamImg.layer.masksToBounds = false
        teamImg.layer.borderColor = UIColor.black.cgColor
        teamImg.layer.cornerRadius = teamImg.frame.height/2
        teamImg.clipsToBounds = true
    }
    
    @IBOutlet weak var teamImg: UIImageView!
    
}
