//
//  CircuitItem.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import Foundation

struct CircuitItem: Decodable {
    
    let id: Int
    let name: String
    let image: String
    let competition: CircuitCompetition
    let first_grand_prix: Int?
    let laps: Int
    let length: String
    let race_distance: String
    let lap_record: CircuitLapRecord
    let capacity: Int?
    let opened: Int?
    let owner: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
        case competition
        case first_grand_prix
        case laps
        case length
        case race_distance
        case lap_record
        case capacity
        case opened
        case owner
    }
    

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
        self.competition = try container.decode(CircuitCompetition.self, forKey: .competition)
        self.first_grand_prix = try? container.decode(Int.self, forKey: .first_grand_prix)
        self.laps = try container.decode(Int.self, forKey: .laps)
        self.length = try container.decode(String.self, forKey: .length)
        self.race_distance = try container.decode(String.self, forKey: .race_distance)
        self.lap_record = try container.decode(CircuitLapRecord.self, forKey: .lap_record)
        self.capacity = try? container.decode(Int.self, forKey: .capacity)
        self.opened = try? container.decode(Int.self, forKey: .opened)
        self.owner = try? container.decode(String.self, forKey: .owner)
    }
    
}
