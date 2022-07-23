//
//  DeportesModel.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 21/07/22.
//

import Foundation

class LigasModel {
    
    struct LigasDatas : Codable {
        let leagues : [Leagues]?

        enum CodingKeys: String, CodingKey {

            case leagues = "leagues"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            leagues = try values.decodeIfPresent([Leagues].self, forKey: .leagues)
        }

    }

    
    struct Leagues : Codable {
        let idLeague : String?
        let strLeague : String?
        let strSport : String?
        let strLeagueAlternate : String?

        enum CodingKeys: String, CodingKey {

            case idLeague = "idLeague"
            case strLeague = "strLeague"
            case strSport = "strSport"
            case strLeagueAlternate = "strLeagueAlternate"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
            strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
            strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
            strLeagueAlternate = try values.decodeIfPresent(String.self, forKey: .strLeagueAlternate)
        }

    }

}
