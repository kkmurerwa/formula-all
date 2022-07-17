//
//  CircuitLapRecord.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import Foundation

struct CircuitLapRecord: Decodable {
    let time: String?
    let driver: String?
    let year: String?
    
    enum CodingKeys: String, CodingKey {
        case time
        case driver
        case year
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.time = try? container.decode(String.self, forKey: .time)
        self.driver = try? container.decode(String.self, forKey: .driver)
        self.year = try? container.decode(String.self, forKey: .year)
    }
    
}
