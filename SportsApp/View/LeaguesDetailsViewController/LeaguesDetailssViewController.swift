//
//  LeaguesDetailssViewController.swift
//  SportsApp
//
//  Created by OSX on 3/24/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import CoreData

class LeaguesDetailssViewController: UIViewController {
    var appDelegate:AppDelegate?
    var manageContext:NSManagedObjectContext?
    var team1:NSManagedObject?
    var isFavourable:Bool?
    var ref:passingData?
    var teams:[Teams]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    var leagueDetails : LeagueDetails?
    var events : [Events]?{
        didSet{
            fetchTeamInLeague()
        }
    }
    override func viewDidLoad() {
        isFavourable = true
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        fetchLeagueData()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageContext = appDelegate?.persistentContainer.viewContext
        //bar button item
        let logoutBarButtonItem = UIBarButtonItem(title: "Favo", style: .done, target: self, action: #selector(Saving))
        self.navigationItem.rightBarButtonItem  = logoutBarButtonItem
    }
    @objc func Saving(){
        if(isFavourable!){
        let Entity = NSEntityDescription.entity(forEntityName: "LeagueEntity", in: manageContext!)
        team1 = NSManagedObject(entity: Entity!, insertInto: manageContext)
            team1?.setValue(Int((leagueDetails?.idLeague)!), forKey: "leagueIdd")
        do{
            try manageContext?.save()
            print("Data Saved")
            print("Team Data \(team1)")
            isFavourable = false
           // ref?.passLeagueId(leage: team1 as! LeagueEntity)
        }
        catch let savingError as NSError{
            print(savingError)
        }
        }
        else{
            manageContext?.delete(team1!)
            do{
                try manageContext?.save()
                print("Data Deleted")
                isFavourable = true
            }
            catch let deletError as NSError{
                print(deletError)
            }
        }
        
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    func fetchLeagueData(){
        APICall<SportsNetworking>.fetchData(target: .getEvents(id: Int(leagueDetails?.idLeague ?? "") ?? 0), responseClass: EventsModel.self) { (result) in
            switch result{
            case .success(let response):
                self.events = response?.events
            case .failure(let error):
                print(error)
            }
        }
    }
   func fetchTeamInLeague(){
    APICall<SportsNetworking>.fetchData(target: .getTeamsInLeague, responseClass: TeamModel.self) { (result) in
        switch result{
        case .success(let value):
            self.teams = value?.teams
        case .failure(let error):
            print(error)
        }
    }
    }
    
    
}


// MARK:- UITableViewDataSource,UITableViewDelegate
extension LeaguesDetailssViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! firstCellinLeaguesDetailsVC
            cell.configureCell(events: events ?? [])
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! secondCellinLeagesDetailsVC
            cell.configureCell(events: events ?? [])
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! TeamsTableViewCell
            cell.configureCell(teams: teams ?? [])
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 3
    }
}
