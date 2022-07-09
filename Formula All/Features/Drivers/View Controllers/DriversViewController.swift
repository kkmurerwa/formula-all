//
//  DriversViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import UIKit

class DriversViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = DriverRankingModel()
    
    var drivers = [DriverRankingItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DriversViewController did load")
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Initial network call
        model.getDriverRanking(year: "2022")
    }

}


// MARK: - Driver ranking model delegate

extension DriversViewController: DriverRankingModelDelegate {
    func driversFetched(_ drivers: [DriverRankingItem]) {
        
        self.drivers = drivers
        
        tableView.reloadData()
        
    }
}


// MARK: - Table view methods

extension DriversViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.DRIVER_CELL_ID, for: indexPath) as! DriverTableViewCell
        
        
        // Configure the cell with the data
        
        // Get title for current video
        let driver = self.drivers[indexPath.row]
        
        cell.setDetails(driver)
        
        // Return the cell for displaying
        return cell
    }
    
}
