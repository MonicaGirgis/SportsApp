//
//  Sport.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/26/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import Foundation
struct Sport : Codable{
    var id : String = ""
    var name : String = ""
    var format : String = ""
    var thumb : String = ""
    var desc : String = ""
    var image : String = ""
    
    enum  CodingKeys : String,CodingKey{
        case id = "idSport"
        case name = "strSport" //name
        case format = "strFormat"
        case thumb = "strSportThumb" //strsportThumb
        case desc = "strSportDescription"
        case image = "strSportThumbGreen"
    }
}


struct SportData : Codable{
    var sports : [Sport] = []
    
    enum  CodingKeys : String,CodingKey{
        case sports = "sports"
    }
}

