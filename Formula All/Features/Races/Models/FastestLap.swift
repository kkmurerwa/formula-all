//
//  RaceItemFastestLap.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import Foundation

struct FastestLap: Decodable {
    let driver: FastestLapDriver
    let time: String?
    
    enum CodingKeys: String, CodingKey {
        case driver
        case time
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.driver = try container.decode(FastestLapDriver.self, forKey: .driver)
        self.time = try? container.decode(String.self, forKey: .time)
    }
}
