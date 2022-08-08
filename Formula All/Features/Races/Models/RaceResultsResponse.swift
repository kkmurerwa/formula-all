//
//  RaceResultsResponse.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 08/08/2022.
//

import Foundation

struct RaceResultsResponse: Decodable {
    var items: [DriverRaceResult]?
    
    enum CodingKeys: String, CodingKey {
        case items = "response"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([DriverRaceResult].self, forKey: .items)
    }
}
