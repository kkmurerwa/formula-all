//
//  CircuitLocation.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import Foundation

struct CircuitLocation: Decodable {
    let country: String?
    let city: String?
    
    enum CodinKeys: String, CodingKey {
        case country
        case city
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodinKeys.self)
        
        self.country = try? container.decode(String.self, forKey: .country)
        self.city = try? container.decode(String.self, forKey: .city)
    }
    
}
