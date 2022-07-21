//
//  RaceItemsResponse.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import Foundation

struct RaceItemsResponse: Decodable {
    
    var items: [RaceItem]?
    
    enum CodingKeys: String, CodingKey {
        
        case items = "response"
        
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([RaceItem].self, forKey: .items)
        
    }
    
}
