//
//  RaceItem.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import Foundation

struct RaceItem: Decodable {
    let id: Int
    let competition: CircuitCompetition
    let circuit: RaceItemCircuit
    let season: Int
    let type: String
    let laps: RaceItemLaps
    let fastest_lap: FastestLap
    let distance: String?
    let timezone: String
    let date: Date
    let weather: String?
    let status: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case competition
        case circuit
        case season
        case type
        case laps
        case fastest_lap
        case distance
        case timezone
        case date
        case weather
        case status
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.competition = try container.decode(CircuitCompetition.self, forKey: .competition)
        self.circuit = try container.decode(RaceItemCircuit.self, forKey: .circuit)
        self.season = try container.decode(Int.self, forKey: .season)
        self.type = try container.decode(String.self, forKey: .type)
        self.laps = try container.decode(RaceItemLaps.self, forKey: .laps)
        self.fastest_lap = try container.decode(FastestLap.self, forKey: .fastest_lap)
        self.distance = try? container.decode(String.self, forKey: .distance)
        self.timezone = try container.decode(String.self, forKey: .timezone)
        self.date = try container.decode(Date.self, forKey: .date)
        self.weather = try? container.decode(String.self, forKey: .weather)
        self.status = try container.decode(String.self, forKey: .status)
    }
}
