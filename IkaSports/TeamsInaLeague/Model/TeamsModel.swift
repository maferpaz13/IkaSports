//
//  TeamsModel.swift
//  IkaSports
//
//  Created by Maria Fernanda Paz Rodriguez on 23/07/22.
//

import Foundation

class TeamsModel {
    
    struct TeamsData : Codable {
        let teams : [Teams]?

        enum CodingKeys: String, CodingKey {

            case teams = "teams"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            teams = try values.decodeIfPresent([Teams].self, forKey: .teams)
        }

    }

    
    struct Teams : Codable {
        let idTeam : String?
        let idSoccerXML : String?
        let idAPIfootball : String?
        let intLoved : String?
        let strTeam : String?
        let strTeamShort : String?
        let strAlternate : String?
        let intFormedYear : String?
        let strSport : String?
        let strLeague : String?
        let idLeague : String?
        let strLeague2 : String?
        let idLeague2 : String?
        let strLeague3 : String?
        let idLeague3 : String?
        let strLeague4 : String?
        let idLeague4 : String?
        let strLeague5 : String?
        let idLeague5 : String?
        let strLeague6 : String?
        let idLeague6 : String?
        let strLeague7 : String?
        let idLeague7 : String?
        let strDivision : String?
        let strManager : String?
        let strStadium : String?
        let strKeywords : String?
        let strRSS : String?
        let strStadiumThumb : String?
        let strStadiumDescription : String?
        let strStadiumLocation : String?
        let intStadiumCapacity : String?
        let strWebsite : String?
        let strFacebook : String?
        let strTwitter : String?
        let strInstagram : String?
        let strDescriptionEN : String?
        let strDescriptionDE : String?
        let strDescriptionFR : String?
        let strDescriptionCN : String?
        let strDescriptionIT : String?
        let strDescriptionJP : String?
        let strDescriptionRU : String?
        let strDescriptionES : String?
        let strDescriptionPT : String?
        let strDescriptionSE : String?
        let strDescriptionNL : String?
        let strDescriptionHU : String?
        let strDescriptionNO : String?
        let strDescriptionIL : String?
        let strDescriptionPL : String?
        let strKitColour1 : String?
        let strKitColour2 : String?
        let strKitColour3 : String?
        let strGender : String?
        let strCountry : String?
        let strTeamBadge : String?
        let strTeamJersey : String?
        let strTeamLogo : String?
        let strTeamFanart1 : String?
        let strTeamFanart2 : String?
        let strTeamFanart3 : String?
        let strTeamFanart4 : String?
        let strTeamBanner : String?
        let strYoutube : String?
        let strLocked : String?

        enum CodingKeys: String, CodingKey {

            case idTeam = "idTeam"
            case idSoccerXML = "idSoccerXML"
            case idAPIfootball = "idAPIfootball"
            case intLoved = "intLoved"
            case strTeam = "strTeam"
            case strTeamShort = "strTeamShort"
            case strAlternate = "strAlternate"
            case intFormedYear = "intFormedYear"
            case strSport = "strSport"
            case strLeague = "strLeague"
            case idLeague = "idLeague"
            case strLeague2 = "strLeague2"
            case idLeague2 = "idLeague2"
            case strLeague3 = "strLeague3"
            case idLeague3 = "idLeague3"
            case strLeague4 = "strLeague4"
            case idLeague4 = "idLeague4"
            case strLeague5 = "strLeague5"
            case idLeague5 = "idLeague5"
            case strLeague6 = "strLeague6"
            case idLeague6 = "idLeague6"
            case strLeague7 = "strLeague7"
            case idLeague7 = "idLeague7"
            case strDivision = "strDivision"
            case strManager = "strManager"
            case strStadium = "strStadium"
            case strKeywords = "strKeywords"
            case strRSS = "strRSS"
            case strStadiumThumb = "strStadiumThumb"
            case strStadiumDescription = "strStadiumDescription"
            case strStadiumLocation = "strStadiumLocation"
            case intStadiumCapacity = "intStadiumCapacity"
            case strWebsite = "strWebsite"
            case strFacebook = "strFacebook"
            case strTwitter = "strTwitter"
            case strInstagram = "strInstagram"
            case strDescriptionEN = "strDescriptionEN"
            case strDescriptionDE = "strDescriptionDE"
            case strDescriptionFR = "strDescriptionFR"
            case strDescriptionCN = "strDescriptionCN"
            case strDescriptionIT = "strDescriptionIT"
            case strDescriptionJP = "strDescriptionJP"
            case strDescriptionRU = "strDescriptionRU"
            case strDescriptionES = "strDescriptionES"
            case strDescriptionPT = "strDescriptionPT"
            case strDescriptionSE = "strDescriptionSE"
            case strDescriptionNL = "strDescriptionNL"
            case strDescriptionHU = "strDescriptionHU"
            case strDescriptionNO = "strDescriptionNO"
            case strDescriptionIL = "strDescriptionIL"
            case strDescriptionPL = "strDescriptionPL"
            case strKitColour1 = "strKitColour1"
            case strKitColour2 = "strKitColour2"
            case strKitColour3 = "strKitColour3"
            case strGender = "strGender"
            case strCountry = "strCountry"
            case strTeamBadge = "strTeamBadge"
            case strTeamJersey = "strTeamJersey"
            case strTeamLogo = "strTeamLogo"
            case strTeamFanart1 = "strTeamFanart1"
            case strTeamFanart2 = "strTeamFanart2"
            case strTeamFanart3 = "strTeamFanart3"
            case strTeamFanart4 = "strTeamFanart4"
            case strTeamBanner = "strTeamBanner"
            case strYoutube = "strYoutube"
            case strLocked = "strLocked"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            idTeam = try values.decodeIfPresent(String.self, forKey: .idTeam)
            idSoccerXML = try values.decodeIfPresent(String.self, forKey: .idSoccerXML)
            idAPIfootball = try values.decodeIfPresent(String.self, forKey: .idAPIfootball)
            do{
                
                intLoved = try values.decodeIfPresent(String.self, forKey: .intLoved)
            }catch{
                intLoved = ""
            }
            strTeam = try values.decodeIfPresent(String.self, forKey: .strTeam)
            do{
                strTeamShort = try values.decodeIfPresent(String.self, forKey: .strTeamShort)
                
            }catch{
                strTeamShort = ""
            }
            strAlternate = try values.decodeIfPresent(String.self, forKey: .strAlternate)
            intFormedYear = try values.decodeIfPresent(String.self, forKey: .intFormedYear)
            strSport = try values.decodeIfPresent(String.self, forKey: .strSport)
            strLeague = try values.decodeIfPresent(String.self, forKey: .strLeague)
            idLeague = try values.decodeIfPresent(String.self, forKey: .idLeague)
            strLeague2 = try values.decodeIfPresent(String.self, forKey: .strLeague2)
            idLeague2 = try values.decodeIfPresent(String.self, forKey: .idLeague2)
            strLeague3 = try values.decodeIfPresent(String.self, forKey: .strLeague3)
            idLeague3 = try values.decodeIfPresent(String.self, forKey: .idLeague3)
            strLeague4 = try values.decodeIfPresent(String.self, forKey: .strLeague4)
            do{
                idLeague4 = try values.decodeIfPresent(String.self, forKey: .idLeague4)
                
            }catch{
                
                idLeague4 = ""
            }
            
            strLeague5 = try values.decodeIfPresent(String.self, forKey: .strLeague5)
            do{
                
                idLeague5 = try values.decodeIfPresent(String.self, forKey: .idLeague5)
                
            }catch{
                idLeague5 = ""
            }
            strLeague6 = try values.decodeIfPresent(String.self, forKey: .strLeague6)
            do{
                idLeague6 = try values.decodeIfPresent(String.self, forKey: .idLeague6)
                
            }catch{
                
                idLeague6 = ""
            }
            strLeague7 = try values.decodeIfPresent(String.self, forKey: .strLeague7)
            do{
                idLeague7 = try values.decodeIfPresent(String.self, forKey: .idLeague7)
                
            }catch{
                idLeague7 = ""
            }
            do{
                strDivision = try values.decodeIfPresent(String.self, forKey: .strDivision)
                
            }catch{
                strDivision = ""
            }
            strManager = try values.decodeIfPresent(String.self, forKey: .strManager)
            strStadium = try values.decodeIfPresent(String.self, forKey: .strStadium)
            strKeywords = try values.decodeIfPresent(String.self, forKey: .strKeywords)
            strRSS = try values.decodeIfPresent(String.self, forKey: .strRSS)
            strStadiumThumb = try values.decodeIfPresent(String.self, forKey: .strStadiumThumb)
            strStadiumDescription = try values.decodeIfPresent(String.self, forKey: .strStadiumDescription)
            strStadiumLocation = try values.decodeIfPresent(String.self, forKey: .strStadiumLocation)
            intStadiumCapacity = try values.decodeIfPresent(String.self, forKey: .intStadiumCapacity)
            strWebsite = try values.decodeIfPresent(String.self, forKey: .strWebsite)
            strFacebook = try values.decodeIfPresent(String.self, forKey: .strFacebook)
            strTwitter = try values.decodeIfPresent(String.self, forKey: .strTwitter)
            strInstagram = try values.decodeIfPresent(String.self, forKey: .strInstagram)
            do{
                strDescriptionEN = try values.decodeIfPresent(String.self, forKey: .strDescriptionEN)
                
            }catch{
                strDescriptionEN = ""
            }
            do{
                strDescriptionDE = try values.decodeIfPresent(String.self, forKey: .strDescriptionDE)
                
            }catch{
                strDescriptionDE = ""
            }
            do{
                strDescriptionFR = try values.decodeIfPresent(String.self, forKey: .strDescriptionFR)
                
            }catch{
                strDescriptionFR = ""
            }
            do{
                strDescriptionCN = try values.decodeIfPresent(String.self, forKey: .strDescriptionCN)
                
            }catch{
                strDescriptionCN = ""
            }
            do{
                strDescriptionIT = try values.decodeIfPresent(String.self, forKey: .strDescriptionIT)
                
            }catch{
                strDescriptionIT = ""
            }
            do{
                strDescriptionJP = try values.decodeIfPresent(String.self, forKey: .strDescriptionJP)
                
            }catch{
                strDescriptionJP = ""
            }
            do{
                strDescriptionRU = try values.decodeIfPresent(String.self, forKey: .strDescriptionRU)
                
            }catch{
                strDescriptionRU = ""
            }
            do{
                strDescriptionES = try values.decodeIfPresent(String.self, forKey: .strDescriptionES)
                
            }catch{
                strDescriptionES = ""
            }
            do{
                strDescriptionPT = try values.decodeIfPresent(String.self, forKey: .strDescriptionPT)
                
            }catch{
                strDescriptionPT = ""
            }
            do{
                strDescriptionSE = try values.decodeIfPresent(String.self, forKey: .strDescriptionSE)
                
            }catch{
                strDescriptionSE = ""
            }
            do{
                strDescriptionNL = try values.decodeIfPresent(String.self, forKey: .strDescriptionNL)
                
            }catch{
                strDescriptionNL = ""
            }
            do{
                strDescriptionHU = try values.decodeIfPresent(String.self, forKey: .strDescriptionHU)
                
            }catch{
                strDescriptionHU = ""
            }
            do{
                strDescriptionNO = try values.decodeIfPresent(String.self, forKey: .strDescriptionNO)
                
            }catch{
                strDescriptionNO = ""
            }
            do{
                strDescriptionIL = try values.decodeIfPresent(String.self, forKey: .strDescriptionIL)
                
            }catch{
                strDescriptionIL = ""
            }
            do{
                strDescriptionPL = try values.decodeIfPresent(String.self, forKey: .strDescriptionPL)
                
            }catch{
                strDescriptionPL = ""
            }
            do{
                strKitColour1 = try values.decodeIfPresent(String.self, forKey: .strKitColour1)
                
            }catch{
                strKitColour1 = ""
            }
            do{
                strKitColour2 = try values.decodeIfPresent(String.self, forKey: .strKitColour2)
                
            }catch{
                strKitColour2 = ""
            }
            do{
                strKitColour3 = try values.decodeIfPresent(String.self, forKey: .strKitColour3)
                
            }catch{
                strKitColour3 = ""
            }
            strGender = try values.decodeIfPresent(String.self, forKey: .strGender)
            strCountry = try values.decodeIfPresent(String.self, forKey: .strCountry)
            strTeamBadge = try values.decodeIfPresent(String.self, forKey: .strTeamBadge)
            strTeamJersey = try values.decodeIfPresent(String.self, forKey: .strTeamJersey)
            strTeamLogo = try values.decodeIfPresent(String.self, forKey: .strTeamLogo)
            strTeamFanart1 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart1)
            strTeamFanart2 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart2)
            strTeamFanart3 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart3)
            strTeamFanart4 = try values.decodeIfPresent(String.self, forKey: .strTeamFanart4)
            strTeamBanner = try values.decodeIfPresent(String.self, forKey: .strTeamBanner)
            strYoutube = try values.decodeIfPresent(String.self, forKey: .strYoutube)
            strLocked = try values.decodeIfPresent(String.self, forKey: .strLocked)
        }

    }

    
}
