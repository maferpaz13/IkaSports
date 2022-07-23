//
//  DeportesAPIClient.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import Foundation
import Alamofire

class LigasAPIClient{
    
    func getLigas(completion: @escaping (AFDataResponse<Data>) -> ()) {
        
        
        AF.request(EndPoints.domain+URLGet.Ligas, method: .get, encoding: JSONEncoding.default).responseData {
            
            (Result) in
            
            completion(Result)
        }
        
    }
}
