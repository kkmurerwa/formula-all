//
//  DriversViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import UIKit

class DriversViewController: UIViewController {
    
    var model = DriverRankingModel()
    
    var drivers = [DriverRankingItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DriversViewController did load")
        
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Initial network call
        model.getDriverRanking(year: "2022")
    }

}


// MARK: - Driver ranking model delegate

extension DriversViewController: DriverRankingModelDelegate {
    func driversFetched(_ drivers: [DriverRankingItem]) {
        
        
        dump(drivers)
    }
}
