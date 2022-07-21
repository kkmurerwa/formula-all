//
//  NextRacesViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import UIKit
import XLPagerTabStrip

class NextRacesViewController: UIViewController {
    
    
    var model = RaceItemsModel()
    
    var races = [RaceItem]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        model.delegate = self
        
        model.fetchRaces(byId: nil, ofType: Constants.RaceTypes.PRACTICE_1, forSeason: nil, raceDate: .next)
    }

}


// MARK: -> XLPager Section

extension NextRacesViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Next Races")
    }
}


// MARK: - Driver ranking model delegate

extension NextRacesViewController: RaceItemsModelDelegate {
    func racesFetched(_ races: [RaceItem]) {
        
        self.races = races
        
        dump(races)
    }
}
