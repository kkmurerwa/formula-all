//
//  TeamRankingItem.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 18/07/2022.
//

import Foundation

struct TeamRankingItem: Decodable {
    let position: Int
    let team: TeamDetails
    let points: Int?
    let season: Int
    
    enum CodingKeys: String, CodingKey {
        case position
        case team
        case points
        case season
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.position = try container.decode(Int.self, forKey: .position)
        self.team = try container.decode(TeamDetails.self, forKey: .team)
        self.points = try? container.decode(Int.self, forKey: .points)
        self.season = try container.decode(Int.self, forKey: .season)
    }
}
