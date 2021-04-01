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
    var myResult:Bool?
    var leaguesArray:[LeagueEntity]? = []
    var ref:passingData?
    var teams:[Team]?{
        didSet{
            self.tableView.reloadData()
        }
    }
    var leagueDetails : LeagueDetails?
    var id : Int?
    var events : [Events]?{
        didSet{
            fetchTeamInLeague()
        }
    }
    
    
    @IBOutlet weak var favoriteBtnOutlet: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        fetchEventsData()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageContext = appDelegate?.persistentContainer.viewContext
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        myResult = checkItemInsideCoreData(id: Int64((leagueDetails?.idLeague)!)!)
        if (myResult!){
            favoriteBtnOutlet.image = UIImage(named: "like-2")
        }
        else{
            favoriteBtnOutlet.image = UIImage(named: "like")
        }
    }

    func fetchEventsData(){
        APICall<SportsNetworking>.fetchData(target: .getEvents(id: Int(leagueDetails?.idLeague ?? "") ?? 0), responseClass: EventsModel.self) { (result) in
            switch result{
            case .success(let response):
                self.events = response?.events
            case .failure(_): break
            }
        }
    }
    func fetchTeamInLeague(){
        APICall<SportsNetworking>.fetchData(target: .getTeamsInLeague(id : Int(leagueDetails?.idLeague ?? "") ?? 0), responseClass: TeamModel.self) { (result) in
            switch result{
            case .success(let value):
                self.teams = value?.teams
            case .failure(_): break
            }
        }
    }

    @IBAction func favoriteBtn(_ sender: Any) {
        if favoriteBtnOutlet.image == UIImage(named: "like-2"){
            favoriteBtnOutlet.image = UIImage(named: "like")
            deleteFromCoreData()
        }
        else{
            favoriteBtnOutlet.image = UIImage(named: "like-2")
            savingInto()
        }
    }
    
    func savingInto(){
        let Entity = NSEntityDescription.entity(forEntityName: "LeagueEntity", in: manageContext!)
        team1 = NSManagedObject(entity: Entity!, insertInto: manageContext)
        team1?.setValue(Int((leagueDetails?.idLeague)!), forKey: "leagueIdd")
        team1?.setValue(leagueDetails?.name, forKey: "leagueName")
        team1?.setValue(leagueDetails?.badge, forKey: "leagueImage")
        do{
            try manageContext?.save()
            print("Data Saved")
            print("Team Data \(team1)")
            
        }
        catch let savingError as NSError{
            print(savingError)
        }
    }
    
    func deleteFromCoreData(){
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
        
            for l in leaguesArray!{
                if l.leagueIdd == Int64((leagueDetails?.idLeague)!){
                    manageContext?.delete(l)
                    
                    do{
                       try manageContext?.save()
                    }catch let error{
                        print(error)
                    }
                }
            }
            
        }
       
    
    
    
    func checkItemInsideCoreData(id:Int64)->Bool{
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
        do{
            leaguesArray = try manageContext?.fetch(fetchRequest) as! [LeagueEntity]
        }
        catch let error {
            print(error)
        }
        
        for leaguee in leaguesArray ?? []{
            if leaguee.leagueIdd == id{
                return true
            }
        }
        
        return false
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
