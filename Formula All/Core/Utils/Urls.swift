//
//  Urls.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import Foundation

class Urls {
    
    static let API_URL = "https://v1.formula-1.api-sports.io"
    
    
    // MARK: - API Auth section
    
    static let WEB_HOST = "v1.formula-1.api-sports.io"
    
    static let ACCESS_TOKEN_KKMURERWA = "b2527075bb6673ccf19ae7a94f19f13c"
    static let ACCESS_TOKEN_XWAXES = "b18a979cf82175f555de495616992e33"
    
    static let ACCESS_TOKEN = ACCESS_TOKEN_XWAXES
    
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
    
    static func RACES_BY_SEASON(forSeason: String) -> String {
        return "\(API_URL)/races?season=\(forSeason)"
    }
    
    static func RACES(
        byId: Int? = nil,
        ofType: String? = nil,
        forSeason: String? = nil,
        raceDate: Constants.RaceDate
    ) -> String {
        
        let limit = 60
        
        let urlString = "\(API_URL)/races?"
        
        var params = [String]()
        
        if ofType != nil {
            params.append("type=\(ofType!)")
        }
        
        if forSeason != nil {
            params.append("season=\(forSeason!)")
        }
         
        switch raceDate {
        case Constants.RaceDate.next:
            params.append("next=\(limit)")
        case Constants.RaceDate.previous:
            params.append("previous=\(limit)")
        default: break
        }
        
        let joined = params.joined(separator: "&")
        
        return urlString + joined
    }
    
    
    // MARK: - Circuits URLs
    static let CIRCUITS_URL = "\(API_URL)/circuits"
    
}
