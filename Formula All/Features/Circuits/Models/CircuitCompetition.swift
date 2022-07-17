//
//  CircuitCompetition.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import Foundation

struct CircuitCompetition: Decodable {
    let id: Int
    let name: String
    let location: CircuitLocation
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case location
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.location = try container.decode(CircuitLocation.self, forKey: .location)
    }
}
