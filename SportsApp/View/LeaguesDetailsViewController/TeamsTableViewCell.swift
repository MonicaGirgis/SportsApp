//
//  TeamsTableViewCell.swift
//  SportsApp
//
//  Created by OSX on 3/24/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import SDWebImage
class TeamsTableViewCell: UITableViewCell {
    var teams:[Team]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
    }

    @IBOutlet weak var teamsLbl: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    func configureCell(teams:[Team]){
        self.teams = teams
        self.collectionView.reloadData()
    }

}


extension TeamsTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return teams?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imagessCell", for: indexPath) as! teamImagesCollectionViewCell
        cell.teamImg.sd_setImage(with: URL(string: teams?[indexPath.row].strTeamBadge ?? ""), placeholderImage: UIImage(named: "JourneyToTheCenterOfEarth"))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "teamsVc") as! TeamDetailsViewController
        vc.teamObj = teams![indexPath.row]
        let currentControoler = self.getCurrentViewControoler()
        currentControoler!.present(vc,animated:true,completion:nil)
    }
    
    func getCurrentViewControoler()->UIViewController?{
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController{
            var currentControllerr:UIViewController! = rootViewController
            while((currentControllerr.presentedViewController) != nil){
                currentControllerr = currentControllerr.presentedViewController!
            }
            return currentControllerr
        }
        return nil
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width  , height: collectionView.frame.height) 
    }
    
    
}
