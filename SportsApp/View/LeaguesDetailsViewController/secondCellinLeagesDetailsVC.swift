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

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBOutlet weak var matchesLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
}

extension secondCellinLeagesDetailsVC:UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latestResult", for: indexPath) as! LatestResultCollectionViewCell
        cell.dateLab.text = " 2033-4-2"
        cell.firstTeamNameLb.text = " gggg"
        cell.secondTeameNameLb.text = " nnnnnn"
        cell.firstTeamScoreLb.text = " 70"
        cell.secondTeamScoreLab.text = " 80"
        cell.timeLab.text = "8:9 am"
        return cell
    }
    
    
}
