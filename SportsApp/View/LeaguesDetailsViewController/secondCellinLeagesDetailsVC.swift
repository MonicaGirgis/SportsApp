//
//  secondCellinLeagesDetailsVC.swift
//  SportsApp
//
//  Created by OSX on 3/24/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class secondCellinLeagesDetailsVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    var events : [Events]?
    @IBOutlet weak var matchesLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    func configureCell(events : [Events]){
        self.events = events
        collectionView.reloadData()
    }
}

extension secondCellinLeagesDetailsVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return events?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResult", for: indexPath) as! LatestResultCollectionViewCell
        cell.configureCell(firstTeam: events?[indexPath.row].strHomeTeam ?? "", secondTeam: events?[indexPath.row].strAwayTeam ?? "", firstScore: events?[indexPath.row].intHomeScore ?? "", secondScore: events?[indexPath.row].intAwayScore ?? "", date: events?[indexPath.row].dateEvent ?? "", time: events?[indexPath.row].strTime ?? "")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width , height: collectionView.frame.height)
    }
}
