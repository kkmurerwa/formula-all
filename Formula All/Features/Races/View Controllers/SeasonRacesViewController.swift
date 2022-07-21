//
//  SeasonRacesViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import UIKit
import XLPagerTabStrip

class SeasonRacesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


// MARK: -> XLPager Section

extension SeasonRacesViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Season Races")
    }
}
