//
//  Points.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 16/07/2022.
//

import Foundation

//struct Points: Decodable {
//
//    var value: String = "0"
//
//    var tempPoints: Points
//
////    var integer: Int
////    var string: String
//
//    enum CodingKeys: String, CodingKey {
//        case value = "points"
//    }
//
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
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.value = try container.decode(Points.self, forKey: .temp)
//
//    }
//
//}
