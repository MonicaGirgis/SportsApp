//
//  LeaguesCustomTableViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import SDWebImage
import  Reachability

protocol LeaguesCustomTableViewCellDelegate: class{
    func didTapYoutubeButton(url : String)
    func showError()
    func noInternetError()
}

class LeaguesCustomTableViewCell: UITableViewCell {
    
    var reachability:Reachability? = Reachability()
    weak var delegate : LeaguesCustomTableViewCellDelegate?
    var leagueDetail : LeagueDetails?

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
        leaguesImg.layer.cornerRadius = leaguesImg.frame.height/2
        leaguesImg.clipsToBounds = true
    }
    
    
    @IBOutlet weak var leagueView: UIView!
    @IBOutlet weak var leaguesImg: UIImageView!
    @IBOutlet weak var leaguesTitle: UILabel!
    
    func configure(leagueDetail : LeagueDetails){
        self.leagueDetail = leagueDetail
        leaguesTitle.text = leagueDetail.name
    }
    
    @IBAction func gotoYoutubeBtn(_ sender: Any) {
        
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
    
}
