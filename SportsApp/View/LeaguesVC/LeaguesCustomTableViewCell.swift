//
//  LeaguesCustomTableViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class LeaguesCustomTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        leagueView.layer.borderWidth = 3
        leagueView.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        leagueView.layer.cornerRadius = 8
        leagueView.layer.cornerRadius = 8
        leaguesImg.layer.cornerRadius = leaguesImg.frame.size.width / 2
        //image
        leaguesImg.layer.borderWidth = 1
        leaguesImg.layer.masksToBounds = false
        leaguesImg.layer.borderColor = UIColor.black.cgColor
        // cell.leaguesImg.layer.cornerRadius = cell.leaguesImg.frame.width/2
        leaguesImg.layer.cornerRadius = leaguesImg.frame.height/2
        
        leaguesImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBOutlet weak var leagueView: UIView!
    
    @IBOutlet weak var leaguesImg: UIImageView!
    
    @IBOutlet weak var leaguesTitle: UILabel!
    
    @IBAction func openWebViewBtn(_ sender: Any) {
        print("Hello Web View\n")
    }
}
