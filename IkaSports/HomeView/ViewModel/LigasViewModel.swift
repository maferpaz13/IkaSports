//
//  DeportesViewModel.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import Foundation

class LigasViewModel {
    
        
    func getLigas(completion: @escaping (LigasModel.LigasDatas?)->()){
            
            LigasAPIClient().getLigas { (Result) in
                switch Result.result{
                case .success(_):
                    if let data = try?
                        JSONDecoder().decode(LigasModel.LigasDatas.self, from: Result.data!) as LigasModel.LigasDatas {
                        
                        completion(data)
                    }
                case .failure(_):
                    
                    completion(nil)
                }
            }
        }
        
    
}
