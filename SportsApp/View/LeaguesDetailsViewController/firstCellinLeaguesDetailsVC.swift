
//
//  firstCellinLeaguesDetailsVC.swift
//  SportsApp
//
//  Created by OSX on 3/24/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class firstCellinLeaguesDetailsVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    var leagueDetail :LeagueDetails?
    @IBOutlet weak var upCommingLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!

}

//MARK:- UICollectionViewDataSource,UICollectionViewDelegate
extension firstCellinLeaguesDetailsVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpCommingEventsCollectionViewCell", for: indexPath) as! UpCommingEventsCollectionViewCell
       // cell.configureCell(eventName: , eventdate: <#T##String#>, eventTime: <#T##String#>)
        
        return cell
    }
    
    
}
