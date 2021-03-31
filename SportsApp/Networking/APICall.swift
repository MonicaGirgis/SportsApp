//
//  APICall.swift
//  SportsApp
//
//  Created by Monica Girgis on 3/26/21.
//  Copyright © 2021 OSX. All rights reserved.
//

import Foundation
import Alamofire

class APICall<T: TargetType>{
    
    static func fetchData<M: Codable>(target:T , responseClass: M.Type , completion:@escaping (Result<M?>)->Void){
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        
        Alamofire.request(target.baseURL + target.path, method: method ?? .get, encoding: JSONEncoding.default).responseJSON { (response) in
            guard let jsonResponse = response.result.value else{
                completion(.failure(NSError()))
                return
            }
            guard let JSONData = try?  JSONSerialization.data(withJSONObject: jsonResponse, options: []) else{
                // completion(.failure(NSError()))
                return
            }
            guard let responseObj = try? JSONDecoder().decode(M.self, from: JSONData) else{
                completion(.failure(NSError()))
                return
            }
            completion(.success(responseObj))
        }
    }
}

