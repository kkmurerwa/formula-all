//
//  PreviousRacesViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import UIKit
import XLPagerTabStrip

class PreviousRacesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}


// MARK: -> XLPager Section

extension PreviousRacesViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Previous Races")
    }
}
