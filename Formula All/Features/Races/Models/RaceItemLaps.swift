//
//  RaceItemLaps.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import Foundation

struct RaceItemLaps: Decodable {
    let current: String?
    let total: String?
    
    enum CodingKeys: String, CodingKey {
        case current
        case total
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.current = try? container.decode(String.self, forKey: .current)
        self.total = try? container.decode(String.self, forKey: .total)
    }
    
}
