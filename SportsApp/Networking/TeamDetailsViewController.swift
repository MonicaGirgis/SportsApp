//
//  TeamDetailsViewController.swift
//  SportsApp
//
//  Created by OSX on 3/29/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import SDWebImage
class TeamDetailsViewController: UIViewController {
    var teamObj:Teams?
    override func viewDidLoad() {
        super.viewDidLoad()
        teamNameLbl.text = teamObj?.strTeamShort
        leagueNamesLbl.text = teamObj?.strLeague
        countryLab.text = teamObj?.strCountry
        staudiumNameLabel.text = teamObj?.strStadiumLocation
        detailedDescLab.text = teamObj?.strDescriptionEN
        foundedYearLab.text = teamObj?.intFormedYear
        guard let stadiumImgUrl = teamObj?.strStadiumThumb else {return}
        leagueImg.sd_setImage(with: URL(string: stadiumImgUrl), placeholderImage: UIImage(named: "TheHobbit"))
        guard let imgUrl = teamObj?.strTeamBadge else {return}
         teamImg.sd_setImage(with: URL(string: imgUrl), placeholderImage: UIImage(named: "Favourite"))
        
        //imageView.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))
        
    }
    
    @IBOutlet weak var leagueNamesLbl: UILabel!
    @IBOutlet weak var teamNameLbl: UILabel!
    @IBOutlet weak var teamImg: UIImageView!
    
    @IBOutlet weak var leagueImg: UIImageView!
    
    @IBOutlet weak var staudiumNameLabel: UILabel!
    @IBOutlet weak var foundedYearLab: UILabel!
    @IBOutlet weak var countryLab: UILabel!
    
    @IBOutlet weak var detailedDescLab: UILabel!
}
