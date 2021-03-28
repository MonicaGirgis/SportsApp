//
//  League.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/27/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import Foundation

struct League:Codable{
    var id : String? = ""
    var name : String? = ""
    var sport : String? = ""
    var leagueAlternate : String? = ""
    
    enum  CodingKeys : String,CodingKey{
        case id = "idLeague"
        case name = "strLeague"
        case sport = "strSport"
        case leagueAlternate = "strLeagueAlternate"
    }
}

struct LeaguesData:Codable{
    var leagues : [League] = []
    
    enum  CodingKeys : String,CodingKey{
        case leagues = "leagues"
    }
}
