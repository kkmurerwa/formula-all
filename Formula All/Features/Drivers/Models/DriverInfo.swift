//
//  DriverBrief.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import Foundation

struct DriverInfo: Decodable {
    
    let id: Int?
    let name: String?
    let abbr: String?
    let number: Int?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case abbr
        case number
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.abbr = try container.decodeIfPresent(String.self, forKey: .abbr)
        self.number = try container.decodeIfPresent(Int.self, forKey: .number)
        self.image = try container.decodeIfPresent(String.self, forKey: .image)
    }
    
}
