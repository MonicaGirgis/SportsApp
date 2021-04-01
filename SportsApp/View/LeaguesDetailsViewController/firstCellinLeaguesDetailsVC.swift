
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
    
    var events : [Events]?
    @IBOutlet weak var upCommingLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func configureCell(events : [Events]){
        self.events = events
        collectionView.reloadData()
    }

}

//MARK:- UICollectionViewDataSource,UICollectionViewDelegate
extension firstCellinLeaguesDetailsVC:UICollectionViewDataSource,UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UpCommingEventsCollectionViewCell", for: indexPath) as! UpCommingEventsCollectionViewCell
        cell.configureCell(eventName: events?[indexPath.item].strEvent ?? "", eventdate: events?[indexPath.row].dateEvent ?? "", eventTime: events?[indexPath.row].strTime ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
