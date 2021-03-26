//
//  SportsNetworking.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/26/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import Foundation
enum SportsNetworking{
    case getSports
    case getLeagues
    //case getCountries
    //case getLeaguesInCountry
    case getSeasonsInLeague
    //case getTeamsInLeague
    case getLeagueDetails
}

extension SportsNetworking : TargetType{
    var baseURL: String {
        switch self {
        default:
            return "https://www.thesportsdb.com/api/v1/json/1/"
        }
    }
    
    var path: String {
        switch self {
        case .getSports:
            return "all_sports.php"
        case .getLeagues:
            return "all_leagues.php"
        case .getSeasonsInLeague:
            return "search_all_seasons.php?id=4328"
        case .getLeagueDetails:
            return "lookupleague.php?id=4346"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
    
    
}


//class FetchData : APICall<SportsNetworking>{
//
//    func getSports(){
//        self.fetchData(target: .getSports, responseClass: SportData.self) { (result) in
//            switch result {
//            case .success(let response):
//                guard let sports = result.value else {
//                    return
//                }
//                for sport in sports?.sports ?? []{
//                    print(sport.name)
//                }
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//}
