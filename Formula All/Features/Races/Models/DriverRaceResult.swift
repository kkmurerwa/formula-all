//
//  DriverRaceResult.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 08/08/2022.
//

import Foundation

struct DriverRaceResult: Decodable {
    
    let race: RaceItemMinimal
    let driver: DriverInfo
    let team: TeamDetails
    let position: Int
    let time: String
    let laps: Int
    let grid: String?
    let pits: Int?
    let gap: Int?
    
    enum CodingKeys: String, CodingKey {
        case race
        case driver
        case team
        case position
        case time
        case laps
        case grid
        case pits
        case gap
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.race = try container.decode(RaceItemMinimal.self, forKey: .race)
        self.driver = try container.decode(DriverInfo.self, forKey: .driver)
        self.team = try container.decode(TeamDetails.self, forKey: .team)
        self.position = try container.decode(Int.self, forKey: .position)
        self.time = try container.decode(String.self, forKey: .time)
        self.laps = try container.decode(Int.self, forKey: .laps)
        self.grid = try? container.decode(String.self, forKey: .grid)
        self.pits = try? container.decode(Int.self, forKey: .pits)
        self.gap = try? container.decode(Int.self, forKey: .gap)
    }
    
}
