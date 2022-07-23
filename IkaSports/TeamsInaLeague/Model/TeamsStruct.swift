//
//  TeamsStruct.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import Foundation

struct TeamsStruct {
    
    var dict = [
    
        "l": ""
        
        
    ] as [String: Any]
    
    init(league: String){
       
        dict["l"] = league
        
        
    }
    
}
