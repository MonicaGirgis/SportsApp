//
//  AllSportsViewController.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import SDWebImage


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
            case .failure(let _): break
            }
        }
    }
}



//MARK:- UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
extension AllSportsViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print(sportArray.sports.count)
        return sportArray.sports.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AllSportsCustomCollectionViewCell", for: indexPath) as! AllSportsCustomCollectionViewCell
        cell.sportsName.text = sportArray.sports[indexPath.row].name
        let imageUrl = sportArray.sports[indexPath.row].thumb
        cell.sportsImage.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "JourneyToTheCenterOfEarth"))
        // cell.sportsImage.Alamofire.setImage(withURL: imageUrl)
        cell.sportsView.layer.borderWidth = 3
        cell.sportsView.layer.borderColor = UIColor(red:222/255, green:69/255, blue:0/255, alpha: 1).cgColor
        cell.sportsView.layer.cornerRadius = 8
        cell.sportsView.layer.cornerRadius = 8
        //cell.sportsView.layer.maskedCorners = true
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "leaguesVC") as! LeaguesTableViewController
        vc.sportSelected = sportArray.sports[indexPath.row].name
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: 200)
    }
}
