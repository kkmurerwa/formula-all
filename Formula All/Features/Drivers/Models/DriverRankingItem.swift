//
//  DriverRankingItem.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import Foundation

struct DriverRankingItem: Decodable {
    
    let position: Int?
    let driver: DriverInfo?
    let team: DriverRankingTeamInfo?
    var points: Any?
    let wins: Int?
    let behind: Int?
    let season: Int?
    
    enum CodingKeys: String, CodingKey {
        case position
        case driver
        case team
        case points
        case wins
        case behind
        case season
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.position = try container.decodeIfPresent(Int.self, forKey: .position)
        self.driver = try container.decode(DriverInfo.self, forKey: .driver)
        self.team = try container.decode(DriverRankingTeamInfo.self, forKey: .team)
        
        // Attempt to decode points to any type
        self.points = try? container.decode(Int.self, forKey: .points)
        
        if self.points == nil {
            self.points = (try? container.decode(String.self, forKey: .points)) ?? "0"
        }
        
        
        self.wins = (try? container.decode(Int.self, forKey: .wins)) ?? 0
        self.behind = (try? container.decode(Int.self, forKey: .behind)) ?? 0
        self.season = (try? container.decode(Int.self, forKey: .season)) ?? 0
    }
    
}
