
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
    

    @IBOutlet weak var upCommingLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension firstCellinLeaguesDetailsVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpCommingEventsCollectionViewCell", for: indexPath) as! UpCommingEventsCollectionViewCell
        cell.eventNameLb.text = " Match"
        cell.eventdataLb.text = " 2022-3-31"
        cell.eventTimeLb.text = " 6:45"
        
        return cell
    }
    
    
}
