//
//  DriverDetailsResponse.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import Foundation

struct DriverDetailsResponse: Decodable {
    let items: [DriverDetails]?
    
    enum CodingKeys: String, CodingKey {
        case items = "response"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.items = try container.decode([DriverDetails].self, forKey: .items)
    }
}
