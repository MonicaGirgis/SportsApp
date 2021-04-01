//
//  FavouriteSportsCustomTableViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import Reachability

class FavouriteSportsCustomTableViewCell: UITableViewCell {
    
    weak var delegate : LeaguesCustomTableViewCellDelegate?
    var leagueDetail : LeagueDetails?
    var reachability:Reachability? = Reachability()
    
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

    @IBAction func gotoYoutube(_ sender: Any) {
        
        reachability!.whenReachable = { reachability in
            guard let url = self.leagueDetail?.youtube, !url.isEmpty else {
                self.delegate?.showError()
                return
            }
            self.delegate?.didTapYoutubeButton(url: url)
        }
        
        reachability!.whenUnreachable = { _ in
            self.delegate?.noInternetError()
        }
        
        do {
            try reachability!.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
    @IBOutlet weak var favouriteSportView: UIView!
    @IBOutlet weak var favouriteSportImg: UIImageView!
    @IBOutlet weak var favouriteSportNameLbl: UILabel!
}
