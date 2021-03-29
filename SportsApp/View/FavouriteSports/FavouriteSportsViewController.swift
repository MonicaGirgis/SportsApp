//
//  FavouriteSportsViewController.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit
import Reachability
import CoreData
class FavouriteSportsViewController: UIViewController{
   var leagueEntityArray:[LeagueEntity]? = []
    var leagueObj:LeagueDetails?
    var leagueArray:[LeagueDetails]? = [LeagueDetails]()
    var leagueEnttiObj:LeagueEntity?
    var reachability:Reachability?
    var appDelegate:AppDelegate?
    let dispatch:DispatchGroup? = DispatchGroup()
    
    var manageContext:NSManagedObjectContext?
  /*  func passLeagueId(leage: LeagueEntity) {
        leagueEntityArray?.append(leage)
       leagueEnttiObj = leage
    }*/
    var leagueDetailsObj = LeaguesDetailssViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
      //  dispatch = DispatchGroup()
       // leagueDetailsObj.ref = self
        reachability = Reachability()
        appDelegate = UIApplication.shared.delegate as! AppDelegate
        manageContext = appDelegate?.persistentContainer.viewContext
       // fetchSavedData()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        reachability = try! Reachability()
        
        reachability!.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
                do{
                    self.leagueEntityArray =  try self.manageContext?.fetch(fetchRequest) as! [LeagueEntity]
                   self.leagueArray = []
                    self.fetchSavedData()
                   print("League EntityArray = \(self.leagueEntityArray)")
                }
                catch let fetchError as NSError{
                    print(fetchError)
                }
                
            } else {
                print("Reachable via Cellular")
            }
        }
        reachability!.whenUnreachable = { _ in
            print("Not reachable")
        }
        
        do {
            try reachability!.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
      // fetchSavedData2()
        //fetchSavedData()
        dispatch?.notify(queue: .main){
            self.tableView.reloadData()
        }
    }
    func fetchSavedData(){
        for i in  0 ..< leagueEntityArray!.count{
            dispatch?.enter()
            APICall<SportsNetworking>.fetchData(target: .getLeagueDetails(id: leagueEntityArray![i].value(forKey: "leagueIdd") as! Int ), responseClass: LeagueDetailsData.self) { (result) in
            switch result{
            case .success(let response):
                print("Our Response is \(response)")
               // self.leagueArray?.append(response?.details)
                self.leagueArray = self.leagueArray! + (response?.details)!
                print("After fixxing \(self.leagueArray)")
                self.tableView.reloadData()
                self.dispatch?.leave()
               // self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        }
    }
  /*  func fetchSavedData2(){
        //guard let count = leagueEntityArray?.count else {return}
       for i in 0 ..< 5{
       // guard let id2 = leagueEnttiObj?.leagueIdd else {return}
            APICall<SportsNetworking>.fetchData(target: .getLeagueDetails(id: Int(leagueEntityArray![i].leagueIdd) ), responseClass: LeagueDetails.self) { (result) in
            switch result{
            case .success(let response):
                print("Our Response is \(response)")
                self.leagueObj = response
                self.leagueArray?.append(self.leagueObj!)
                self.tableView.reloadData()
            case .failure(let error):
                print("error = \(error)")
            }
        }
        }
    } */
    
    

    @IBOutlet weak var tableView: UITableView!
    

}
extension FavouriteSportsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print("League entity Array \(leagueEntityArray?.count)")
       // return leagueEntityArray?.count ?? 88
        //return leaguesArray?.count
        //print("League Array \(leagueArray?.count)")
       // return (leagueArray?.count)!
       // print("Count \(leagueEntityArray?.count)")
       // return (leagueEntityArray?.count)!
        print("aa \((leagueArray?.count))")
        return (leagueArray!.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteSportsCustomTableViewCell", for: indexPath) as! FavouriteSportsCustomTableViewCell
        cell.favouriteSportImg.sd_setImage(with: URL(string:(leagueArray?[indexPath.row].badge)!), placeholderImage: UIImage(named: "Favourite"))
        cell.favouriteSportNameLbl.text = leagueArray?[indexPath.row].name
        cell.favouriteSportLabel.text = "Amazing Sport"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if reachability!.connection == .wifi {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "seguing", sender: cell)
        }
         else{
            let alert = UIAlertController(title: "Info", message: "You cann't go over as you are offline", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
