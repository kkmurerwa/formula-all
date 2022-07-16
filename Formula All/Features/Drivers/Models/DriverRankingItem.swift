//
//  DriverRankingItem.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import Foundation

struct DriverRankingItem: Decodable {
    
    let position: Int?
    let driver: DriverRankingDriverInfo?
    let team: DriverRankingTeamInfo?
    var points: Any?
    let wins: Int?
    let behind: Int?
    let season: Int?
    
    enum CodingKeys: String, CodingKey {
        case position
        case driver
        case team
        case points
        case wins
        case behind
        case season
    }
    
//    enum Points: Codable {
//        case integer(Int)
//        case string(String)
//        case null
//
//        init(from decoder: Decoder) throws {
//            let container = try decoder.singleValueContainer()
//            if let x = try? container.decode(Int.self) {
//                self = .integer(x)
//                return
//            }
//            if let x = try? container.decode(String.self) {
//                self = .string(x)
//                return
//            }
//            if container.decodeNil() {
//                self = .string("0")
//                return
//            }
//            throw DecodingError.typeMismatch(Points.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Points"))
//        }
//
//        func encode(to encoder: Encoder) throws {
//            var container = encoder.singleValueContainer()
//            switch self {
//            case .integer(let x):
//                try container.encode(String(x))
//            case .string(let x):
//                try container.encode(x)
//            case .null:
//                try container.encode("0")
//            }
//        }
//    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.position = try container.decodeIfPresent(Int.self, forKey: .position)
        self.driver = try container.decode(DriverRankingDriverInfo.self, forKey: .driver)
        self.team = try container.decode(DriverRankingTeamInfo.self, forKey: .team)
        
        // Attempt to decode points to any type
        self.points = try? container.decode(Int.self, forKey: .points)
        
        if self.points == nil {
            self.points = (try? container.decode(String.self, forKey: .points)) ?? "0"
        }
        
        
        self.wins = (try? container.decode(Int.self, forKey: .wins)) ?? 0
        self.behind = (try? container.decode(Int.self, forKey: .behind)) ?? 0
        self.season = (try? container.decode(Int.self, forKey: .season)) ?? 0
    }
    
}
