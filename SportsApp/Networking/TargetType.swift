//
//  TargetType.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/26/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPMethod : String{
    case get = "GET"
}

protocol TargetType {
    var baseURL : String { get }
    var path : String { get }
    var method : HTTPMethod { get }
}
