//
//  RaceItemMinimal.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 08/08/2022.
//

import Foundation

struct RaceItemMinimal: Decodable {
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case id
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
    }
}
