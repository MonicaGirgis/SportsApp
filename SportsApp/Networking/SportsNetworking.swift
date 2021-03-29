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
    case getSeasonsInLeague
    case getLeagueDetails(id: Int)
    case getEvents(id: Int)
    case getTeamsInLeague
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
        case .getLeagueDetails(let id):
            return "lookupleague.php?id=\(id)"
        case .getEvents(let id):
            return "eventspastleague.php?id=\(id)"
        case .getTeamsInLeague:
            return "search_all_teams.php?s=Soccer&c=Spain"
            //https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=4346
            //https://www.thesportsdb.com/api/v1/json/1/lookupleague.php?id=
        }
    }
    
    var method: HTTPMethod {
        switch self {
        default:
            return .get
        }
    }
   
}
