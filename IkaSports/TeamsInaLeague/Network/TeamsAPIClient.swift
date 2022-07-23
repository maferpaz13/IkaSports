//
//  TeamsAPIClient.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import Foundation
import Alamofire

class TeamsAPLIClient{
    
    func getTeams(liga: String, parameters: TeamsStruct,completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        AF.request(EndPoints.domain+URLGet.TeamsinaLeague,method: .get, parameters: parameters.dict).responseData  {
            
            (Result) in
            print(Result.debugDescription)
            completion(Result)
        }
        
    }
    
}
