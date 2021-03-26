//
//  LatestResultCollectionViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/24/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class LatestResultCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        latestResultView.layer.borderWidth = 3
        latestResultView.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        latestResultView.layer.cornerRadius = 8
        latestResultView.layer.cornerRadius = 8
        //labels
        firstTeamNameLb.layer.borderWidth = 2
        firstTeamNameLb.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        firstTeamNameLb.layer.cornerRadius = 2
        firstTeamNameLb.layer.cornerRadius = 2
        //
        secondTeameNameLb.layer.borderWidth = 2
        secondTeameNameLb.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        secondTeameNameLb.layer.cornerRadius = 2
        secondTeameNameLb.layer.cornerRadius = 2
        //
        firstTeamScoreLb.layer.borderWidth = 2
        firstTeamScoreLb.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        firstTeamScoreLb.layer.cornerRadius = 2
        firstTeamScoreLb.layer.cornerRadius = 2
        //
        secondTeamScoreLab.layer.borderWidth = 2
        secondTeamScoreLab.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        secondTeamScoreLab.layer.cornerRadius = 2
        secondTeamScoreLab.layer.cornerRadius = 2
        //
        dateLab.layer.borderWidth = 2
        dateLab.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        dateLab.layer.cornerRadius = 2
        dateLab.layer.cornerRadius = 2
        //
        timeLab.layer.borderWidth = 2
        timeLab.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        timeLab.layer.cornerRadius = 2
        timeLab.layer.cornerRadius = 2
        
        
    }
    
    @IBOutlet weak var latestResultView: UIView!
    
    @IBOutlet weak var firstTeamNameLb: UILabel!
    
    @IBOutlet weak var secondTeameNameLb: UILabel!
    
    
    @IBOutlet weak var firstTeamScoreLb: UILabel!
    
    @IBOutlet weak var secondTeamScoreLab: UILabel!
    
    @IBOutlet weak var dateLab: UILabel!
    
    
    
    @IBOutlet weak var timeLab: UILabel!
}
