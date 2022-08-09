//
//  HighestRaceFinish.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import Foundation

struct HighestRaceFinish: Decodable {
    let position: Int?
    let number: Int?
    
    enum CodingKeys: String, CodingKey {
        case position
        case number
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.position = try? container.decode(Int.self, forKey: .position)
        self.number = try? container.decode(Int.self, forKey: .number)
    }
}
