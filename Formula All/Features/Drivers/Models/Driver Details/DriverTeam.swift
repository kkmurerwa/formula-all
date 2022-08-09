//
//  DriverTeam.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import Foundation

struct DriverTeam: Decodable {
    let season: Int
    let team: TeamDetails
    
    enum CodingKeys: String, CodingKey {
        case season
        case team
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.season = try container.decode(Int.self, forKey: .season)
        self.team = try container.decode(TeamDetails.self, forKey: .team)
    }
}
