//
//  DeportesViewModel.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import Foundation

class DeportesViewModel {
    
        
        func getDeportes(completion: @escaping (DeportesModel.DeportesData?)->()){
            
            DeportesAPIClient().getDeportes { (Result) in
                switch Result.result{
                case .success(_):
                    if let data = try?
                        JSONDecoder().decode(DeportesModel.DeportesData.self, from: Result.data!) as DeportesModel.DeportesData {
                        
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
