//
//  Constants.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import Foundation

struct Constants {
    
    
    // MARK: -> Table View Cells
    
    struct TableViewCells {
        static let CIRCUIT_CELL_ID = "CircuitCell"
        static let DRIVER_CELL_ID = "DriverCell"
        static let TEAM_CELL_ID = "TeamCell"
        static let RACE_CELL_ID = "RaceCell"
        static let RACE_SCHEDULE_ID = "RaceScheduleCell"
        static let RACERS_TABLE_TITLE_ID = "TableTitleCell"
        static let RACERS_TABLE_DRIVER_ID = "RaceDriverCell"
    }
    
    
    // MARK: -> Storyboard IDs
    
    struct StoryBoardIDs {
        static let NEXT_RACES_ID = "NextRaces"
        static let PREVIOUS_RACES_ID = "PreviousRaces"
        static let SEASON_RACES_ID = "SeasonRaces"
    }
    
    
    // MARK: -> Segues
    
    struct Segues {
        static let showRaceDetails = "RaceDetails"
        static let showNextRaceDetails = "nextRaceDetails"
        static let showPreviousRaceDetails = "previousRaceDetails"
        static let showAllRaceItemDetails = "allRaceItemDetails"
        static let showRaceResults = "RaceResults"
    }
    
    
    // MARK: -> Race Params
    
    struct RaceTypes {
        static let PRACTICE_1 = "1st Practice"
        static let PRACTICE_2 = "2nd Practice"
        static let PRACTICE_3 = "3rd Practice"
        
        static let QUALIFYING_1 = "1st Qualifying"
        static let QUALIFYING_2 = "2nd Qualifying"
        static let QUALIFYING_3 = "3rd Qualifying"
        
        static let SPRINT = "Sprint"
        static let RACE = "Race"
    }
    
    enum RaceDate {
        case next
        case previous
        case none
    }
}
