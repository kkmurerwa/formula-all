//
//  Urls.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import Foundation

class Urls {
    
    // MARK: - API Auth section
    
    static let API_URL = "https://v1.formula-1.api-sports.io"
    
    static let WEB_HOST = "v1.formula-1.api-sports.io"
    
    static let ACCESS_TOKEN = AccessTokens.ACCESS_TOKEN
    
    static func API_REQUEST(url: URL, httpMethod: String = "GET") -> URLRequest? {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.setValue(WEB_HOST, forHTTPHeaderField: "x-rapidapi-host")
        request.setValue(ACCESS_TOKEN, forHTTPHeaderField:"x-rapidapi-key")
        request.timeoutInterval = 60.0
        
        return request
    }
    
    
    // MARK: - Driver URLs
    
    static func SEARCH_DRIVERS_URL(withKey: String) -> String {
        return "\(API_URL)/drivers?search=\(withKey)"
    }
    
    static func DRIVER_DETAILS(id: Int) -> String {
        return "\(API_URL)/drivers?id=\(id)"
    }
    
    static func DRIVER_RANKINGS_URL(forYear: String) -> String {
        return "\(API_URL)/rankings/drivers?season=\(forYear)"
    }
    
    
    // MARK: - Teams URLs
    
    static let TEAMS_URL = "\(API_URL)/teams"
    
    static func SEARCH_TEAMS_URL(withKey: String) -> String {
        return "\(API_URL)/teams?search=\(withKey)"
    }
    
    
    // MARK: - Rankings URLs
    
    static func TEAM_RANKINGS_BY_SEASON(forSeason: String) -> String {
        return "\(API_URL)/rankings/teams?season=\(forSeason)"
    }
    
    static func RACE_RANKINGS_BY_RACE(withRaceId: String) -> String {
        return "\(API_URL)/rankings/races?race=\(withRaceId)"
    }
    
    static func STARTING_GRID_BY_RACE(withRaceId: String) -> String {
        return "\(API_URL)/rankings/startinggrid?race=\(withRaceId)"
    }
    
    
    // MARK: - Races URLs
    
    static func RACES(
        byId: Int? = nil,
        ofType: String? = nil,
        forSeason: String? = nil,
        forCompetition: Int? = nil,
        raceDate: Constants.RaceDate
    ) -> String {
        
        let limit = 60
        
        let urlString = "\(API_URL)/races?"
        
        var params = [String]()
        
        if let type = ofType {
            params.append("type=\(type)")
        }
        
        if let season = forSeason {
            params.append("season=\(season)")
        }
         
        if let competition = forCompetition {
            params.append("competition=\(competition)")
        }
        
        switch raceDate {
        case .next:
            params.append("next=\(limit)")
        case .previous:
            params.append("last=\(limit)")
        default: break
        }
        
        let joined = params.joined(separator: "&")
        
        return urlString + joined
    }
    
    static func RACE_RESULTS(
        forRace: Int
    ) -> String {
        return "\(API_URL)/rankings/races?race=\(forRace)"
    }
    
    
    
    
    // MARK: - Circuits URLs
    
    static let CIRCUITS_URL = "\(API_URL)/circuits"
    
}
