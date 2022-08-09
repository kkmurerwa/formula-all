//
//  DriverCountry.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import Foundation

struct DriverCountry: Decodable {
    let name: String?
    let code: String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case code
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.name = try? container.decode(String.self, forKey: .name)
        self.code = try? container.decode(String.self, forKey: .code)
    }
}
