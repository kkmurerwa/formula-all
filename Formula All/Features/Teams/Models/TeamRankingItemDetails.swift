//
//  TeamRankingItemDetails.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 18/07/2022.
//

import Foundation

struct TeamRankingItemDetails: Decodable {
    let id: Int
    let name: String
    let logo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case logo
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.logo = try container.decode(String.self, forKey: .logo)
    }
}
