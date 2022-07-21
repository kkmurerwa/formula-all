//
//  RaceItemCircuit.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import Foundation

struct RaceItemCircuit: Decodable {
    let id: Int
    let name: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.image = try container.decode(String.self, forKey: .image)
    }
}
