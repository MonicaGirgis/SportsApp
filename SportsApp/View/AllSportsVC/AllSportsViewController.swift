//
//  AllSportsViewController.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class AllSportsViewController: UIViewController {
    
    
    var sportArray : SportData = SportData(){
        didSet{
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FetchData()
    }
    

    @IBOutlet weak var collectionView: UICollectionView!
    
    func FetchData(){
        APICall<SportsNetworking>.fetchData(target: .getSports, responseClass: SportData.self) { (result) in
                        switch result {
                        case .success(let response):
                            self.sportArray = response ?? SportData()
                            for sport in self.sportArray.sports {
                               // print(sport.name)
                            }
                        case .failure(let error):
                            print(error)
                        }
                    }
    }
}

extension AllSportsViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(sportArray.sports.count)
        return sportArray.sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllSportsCustomCollectionViewCell", for: indexPath) as! AllSportsCustomCollectionViewCell
        cell.sportsName.text = sportArray.sports[indexPath.row].name
        cell.sportsImage.image = UIImage(named: "TheHobbit")
        //cell.sportsImage
        /* self.carView.layer.borderWidth = 3
         self.carView.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
         carView.layer.cornerRadius = 8;
         carView.layer.masksToBounds = true;*/
        cell.sportsView.layer.borderWidth = 3
        cell.sportsView.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        cell.sportsView.layer.cornerRadius = 8
        cell.sportsView.layer.cornerRadius = 8
        //cell.sportsView.layer.maskedCorners = true
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let leagueObject = self.storyboard?.instantiateViewController(withIdentifier: "leaguesVC")
        self.navigationController?.pushViewController(leagueObject!, animated: true)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 7.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    
}
