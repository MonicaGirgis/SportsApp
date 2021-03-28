//
//  UpCommingEventsCollectionViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/24/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class UpCommingEventsCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        eventView.layer.borderWidth = 3
        eventView.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        eventView.layer.cornerRadius = 8
        eventView.layer.cornerRadius = 8
        eventTimeLb.layer.borderWidth = 3
        eventTimeLb.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        eventTimeLb.layer.cornerRadius = 4
        eventTimeLb.layer.cornerRadius = 4
        eventdataLb.layer.borderWidth = 3
        eventdataLb.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        eventdataLb.layer.cornerRadius = 4
        eventdataLb.layer.cornerRadius = 4
        eventNameLb.layer.borderWidth = 3
        eventNameLb.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        eventNameLb.layer.cornerRadius = 4
        eventNameLb.layer.cornerRadius = 4
    }
    
    @IBOutlet weak var eventView: UIView!
    @IBOutlet weak var eventNameLb: UILabel!
    @IBOutlet weak var eventdataLb: UILabel!
    @IBOutlet weak var eventTimeLb: UILabel!
    
    func configureCell(eventName : String, eventdate : String , eventTime:String){
        eventNameLb.text = eventName
        eventdataLb.text = eventdate
        eventTimeLb.text = eventTime
    }
}
