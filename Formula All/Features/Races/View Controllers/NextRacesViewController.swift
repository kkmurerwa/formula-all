//
//  NextRacesViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import UIKit
import XLPagerTabStrip

class NextRacesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


// MARK: -> XLPager Section

extension NextRacesViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Next Races")
    }
}
