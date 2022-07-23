//
//  TeamsViewModel.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import Foundation

class TeamsViewModel {
    func getTeams(liga: String, parameters: TeamsStruct,completion: @escaping (TeamsModel.TeamsData?)->()){
        
        TeamsAPLIClient().getTeams(liga: liga, parameters: parameters) { (Result) in
            switch Result.result{
            case .success(_):
                if let data = try?
                    JSONDecoder().decode(TeamsModel.TeamsData.self, from: Result.data!) as TeamsModel.TeamsData {
                    
                    completion(data)
                }else{
                    completion(nil)
                }
            case .failure(_):
                
                completion(nil)
            }
        }
    }
}
