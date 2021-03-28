//
//  LeagueDetails.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/27/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import Foundation

struct LeagueDetails:Codable{
    var idLeague : String? = ""
    var idSoccer : String? = ""
    var idAPIfootball : String? = ""
    var sport : String? = ""
    var name : String? = ""
    var leagueAlternate : String? = ""
    var division : String? = ""
    var idCup : String? = ""
    var currentSeason : String? = ""
    var formedYear : String? = ""
    var firstEvent : String? = ""
    var gender : String? = ""
    var country : String? = ""
    var website : String? = ""
    var facebook : String? = ""
    var twitter : String? = ""
    var youtube : String? = ""
    var RSS : String? = ""
    var strDescriptionEN : String? = ""
    var strDescriptionDE : String? = ""
    var strDescriptionFR : String? = ""
    var strDescriptionIT : String? = ""
    var strDescriptionCN : String? = ""
    var strDescriptionJP : String? = ""
    var strDescriptionRU : String? = ""
    var strDescriptionES : String? = ""
    var strDescriptionPT : String? = ""
    var strDescriptionSE : String? = ""
    var strDescriptionNL : String? = ""
    var strDescriptionHU : String? = ""
    var strDescriptionNO : String? = ""
    var strDescriptionPL : String? = ""
    var strDescriptionIL : String? = ""
    var strFanart1 : String? = ""
    var strFanart2 : String? = ""
    var strFanart3 : String? = ""
    var strFanart4 : String? = ""
    var banner : String? = ""
    var badge : String? = ""
    var logo : String? = ""
    var poster : String? = ""
    var trophy : String? = ""
    var strNaming : String? = ""
    var strComplete : String? = ""
    var strLocked : String? = ""
    
    enum  CodingKeys : String,CodingKey{
        case idLeague = "idLeague"
        case name = "strLeague"
        case sport = "strSport"
        case leagueAlternate = "strLeagueAlternate"
        case idSoccer  = "idSoccerXML"
        case idAPIfootball  = "idAPIfootball"
        case division = "strDivision"
        case idCup = "idCup"
        case currentSeason = "strCurrentSeason"
        case formedYear  = "intFormedYear"
        case firstEvent = "dateFirstEvent"
        case gender  = "strGender"
        case country = "strCountry"
        case website = "strWebsite"
        case facebook = "strFacebook"
        case twitter = "strTwitter"
        case youtube = "strYoutube"
        case RSS = "strRSS"
        case strDescriptionEN = "strDescriptionEN"
        case strDescriptionDE = "strDescriptionDE"
        case strDescriptionFR = "strDescriptionFR"
        case strDescriptionIT = "strDescriptionIT"
        case strDescriptionCN = "strDescriptionCN"
        case strDescriptionJP = "strDescriptionJP"
        case strDescriptionRU = "strDescriptionRU"
        case strDescriptionES = "strDescriptionES"
        case strDescriptionPT = "strDescriptionPT"
        case strDescriptionSE = "strDescriptionSE"
        case strDescriptionNL = "strDescriptionNL"
        case strDescriptionHU = "strDescriptionHU"
        case strDescriptionNO = "strDescriptionNO"
        case strDescriptionPL = "strDescriptionPL"
        case strDescriptionIL = "strDescriptionIL"
        case strFanart1 = "strFanart1"
        case strFanart2 = "strFanart2"
        case strFanart3 = "strFanart3"
        case strFanart4 = "strFanart4"
        case strNaming = "strNaming"
        case strComplete = "strComplete"
        case strLocked = "strLocked"
        case banner = "strBanner"
        case badge = "strBadge"
        case logo = "strLogo"
        case poster = "strPoster"
        case trophy = "strTrophy"
    }
}


struct LeagueDetailsData : Codable {
    var details : [LeagueDetails] = []
    
    enum  CodingKeys : String,CodingKey{
        case details = "leagues"
    }
}
