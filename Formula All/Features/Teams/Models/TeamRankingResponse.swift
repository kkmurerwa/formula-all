//
//  TeamRankingResponse.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 18/07/2022.
//

import Foundation

struct TeamRankingResponse: Decodable {
    let items: [TeamRankingItem]?
    
    enum CodingKeys: String, CodingKey {
        case items = "response"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([TeamRankingItem].self, forKey: .items)
    }
}
