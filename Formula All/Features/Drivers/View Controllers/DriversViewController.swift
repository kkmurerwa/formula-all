//
//  DriversViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import UIKit

class DriversViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var seasonsPopupButton: UIButton!
    
    var model = DriverRankingModel()
    
    var drivers = [DriverRankingItem]()
    
    var selectedYear = "2022"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("DriversViewController did load")
        
        setPopupButton()
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        fetchSelectedYearDrivers()
    }
    
    func fetchSelectedYearDrivers() {
        // Initial network call
        model.getDriverRanking(year: "\(selectedYear)")
    }
    
    // MARK: - Seasons Popup Button
    
    func setPopupButton() {
        
        let optionClosure = {(action: UIAction) in
            print(action.title)
            
            self.selectedYear = action.title

            self.fetchSelectedYearDrivers()
//            self.model.getDriverRanking(year: "\(action.title)")
        }
        
        seasonsPopupButton.menu = UIMenu(children: [
            UIAction(title: "2022", state: .on, handler: optionClosure),
            UIAction(title: "2021", handler: optionClosure),
            UIAction(title: "2020", handler: optionClosure),
            UIAction(title: "2019", handler: optionClosure),
            UIAction(title: "2018", handler: optionClosure),
            UIAction(title: "2017", handler: optionClosure),
            UIAction(title: "2016", handler: optionClosure),
            UIAction(title: "2015", handler: optionClosure),
            UIAction(title: "2014", handler: optionClosure),
            UIAction(title: "2013", handler: optionClosure),
            UIAction(title: "2012", handler: optionClosure),
            UIAction(title: "2011", handler: optionClosure),
        ])
        
        seasonsPopupButton.showsMenuAsPrimaryAction = true
        seasonsPopupButton.changesSelectionAsPrimaryAction = true
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
        
        cell.setDetails(indexPath.item + 1, driver)
        
        // Return the cell for displaying
        return cell
    }
    
}
