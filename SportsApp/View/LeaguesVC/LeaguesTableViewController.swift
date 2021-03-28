//
//  LeaguesTableViewController.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import SDWebImage

class LeaguesTableViewController: UITableViewController {
    
    var sportSelected : String = "Soccer"
    var leagues : [League] = []{
        didSet{
            fetchLeaguesDetailsData()
        }
    }
    var leaguesDetails : [LeagueDetails] = []{
        didSet{
            self.tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchLeaguesData()
        setupUI()
    }
    
    func setupUI(){
        self.navigationItem.title = "Leagues"
    }
    
    func fetchLeaguesData(){
        APICall<SportsNetworking>.fetchData(target: .getLeagues, responseClass: LeaguesData.self){ (result) in
            switch result{
            case .success(let response):
                self.leagues = response?.leagues.filter({ (League) -> Bool in
                    League.sport == self.sportSelected
                }) ?? []
            //let index = response?.leagues.firstIndex(where: {$0.leagueAlternate == nil})
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchLeaguesDetailsData(){
        for league in leagues{
            APICall<SportsNetworking>.fetchData(target: .getLeagueDetails(id: Int(league.id ?? "") ?? 0), responseClass: LeagueDetailsData.self){ (result) in
                switch result{
                case .success(let response):
                    self.leaguesDetails.append(response?.details[0] ?? LeagueDetails())
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}



// MARK:- UITableViewControllerDelegate, UITableViewControllerDataSource

extension LeaguesTableViewController{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCustomTableViewCell", for: indexPath) as! LeaguesCustomTableViewCell
        cell.delegate = self
        if(leaguesDetails.count > indexPath.row){
            cell.leaguesImg.sd_setImage(with: URL(string: leaguesDetails[indexPath.row].badge ?? ""), placeholderImage: UIImage(named: "JourneyToTheCenterOfEarth"))
            cell.configure(leagueDetail: leaguesDetails[indexPath.row])
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: LeaguesDetailssViewController.self)) as! LeaguesDetailssViewController
        vc.leagueDetails = leaguesDetails[indexPath.row]
        present(vc, animated: true, completion: nil)
    }
}

extension LeaguesTableViewController : LeaguesCustomTableViewCellDelegate{
    func showError() {
        let alert = UIAlertController(title: "Youtube Channel Not Found", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    func didTapYoutubeButton(url: String) {
        let vc = storyboard?.instantiateViewController(withIdentifier: String(describing: webViewController.self)) as! webViewController
        vc.youtubeURL = url
        present(vc, animated: true, completion: nil)
    }
}
