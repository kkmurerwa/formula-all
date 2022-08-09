//
//  DriverDetails.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import Foundation

struct DriverDetails: Decodable {
    let id: Int
    let name: String
    let abbr: String
    let image: String
    let nationality: String
    let country: DriverCountry
    let birthdate: String
    let birthplace: String?
    let number: Int?
    let grands_prix_entered: String?
    let world_championships: Int
    let podiums: Int
    let highest_race_finish: HighestRaceFinish
    let highest_grid_position: Int?
    let career_points: String
    let teams: [DriverTeam]
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case abbr
        case image
        case nationality
        case country
        case birthdate
        case birthplace
        case number
        case grands_prix_entered
        case world_championships
        case podiums
        case highest_race_finish
        case highest_grid_position
        case career_points
        case teams
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.abbr = try container.decode(String.self, forKey: .abbr)
        self.image = try container.decode(String.self, forKey: .image)
        self.nationality = try container.decode(String.self, forKey: .nationality)
        self.country = try container.decode(DriverCountry.self, forKey: .country)
        self.birthdate = try container.decode(String.self, forKey: .birthdate)
        self.birthplace = try? container.decode(String.self, forKey: .birthplace)
        self.number = try? container.decode(Int.self, forKey: .number)
        self.grands_prix_entered = try? container.decode(String.self, forKey: .grands_prix_entered)
        self.world_championships = try container.decode(Int.self, forKey: .world_championships)
        self.podiums = try container.decode(Int.self, forKey: .podiums)
        self.highest_race_finish = try container.decode(HighestRaceFinish.self, forKey: .highest_race_finish)
        self.highest_grid_position = try? container.decode(Int.self, forKey: .highest_grid_position)
        self.career_points = try container.decode(String.self, forKey: .career_points)
        self.teams = try container.decode([DriverTeam].self, forKey: .teams)
    }
}
