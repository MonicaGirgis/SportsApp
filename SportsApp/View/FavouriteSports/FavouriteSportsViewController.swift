//
//  FavouriteSportsViewController.swift
//  SportsApp
//
//  Created by OSX on 3/23/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import UIKit

class FavouriteSportsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBOutlet weak var tableView: UITableView!
    

}
extension FavouriteSportsViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteSportsCustomTableViewCell", for: indexPath) as! FavouriteSportsCustomTableViewCell
        cell.favouriteSportImg.image = UIImage(named: "TheHobbit")
        cell.favouriteSportNameLbl.text = "BasketBall"
        cell.favouriteSportLabel.text = "Amazing Sport"
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
        
        performSegue(withIdentifier: "seguing", sender: cell)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    
}
