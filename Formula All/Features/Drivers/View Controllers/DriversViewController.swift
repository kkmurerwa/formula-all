//
//  DriversViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import UIKit

class DriversViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var seasonsPopupButton: UIButton!
    
    var model = DriverRankingModel()
    
    var drivers = [DriverRankingItem]()
    
    var selectedYear = "2022"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPopupButton()
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Set current year as default
        selectedYear = Date().convertDate(withFormat: "YYYY")
        
        fetchSelectedYearDrivers()
    }
    
    func fetchSelectedYearDrivers() {
        
        showIsLoading(isLoading: true)
        
        // Initial network call
        model.getDriverRanking(year: "\(selectedYear)")
    }
    
    
    // MARK: - Seasons Popup Button
    
    func setPopupButton() {
        
        let optionClosure = {(action: UIAction) in
            print(action.title)
            
            self.showIsLoading(isLoading: true)
            
            self.selectedYear = action.title

            self.fetchSelectedYearDrivers()
        }
        
        let supportedYears = SupportedYearsModel().getSupportedYears()
        
        var optionsArray = [UIAction]()

        // Loop and populate the actions array
        for (index, year) in supportedYears.enumerated() {
            // Create each action and insert the right country as a title
            let action = UIAction(
                title: year,
                state: index == 0 ? .on : .off,
                handler: optionClosure
            )
                    
            // Add newly created action to actions array
            optionsArray.append(action)
        }
        
        seasonsPopupButton.menu = UIMenu(children: optionsArray)
        
        seasonsPopupButton.showsMenuAsPrimaryAction = true
        seasonsPopupButton.changesSelectionAsPrimaryAction = true
    }

    
    func showIsLoading(isLoading: Bool) {
        if isLoading {
            // Show progress indicator
            loadingIndicator.isHidden = false
            
            // Hide table view
            tableView.isHidden = true
        } else {
            // Show progress indicator
            loadingIndicator.isHidden = true
            
            // Hide table view
            tableView.isHidden = false
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Make sure that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        
        if segue.identifier == Constants.Segues.showDriverDetails {
            if segue.destination is DriverDetailsViewController {
                
                // Get a reference to the video that was tapped on
                let selectedDriver = drivers[tableView.indexPathForSelectedRow!.row]
            
                // Get a reference to the detail view controller
                let driverDetailsVC = segue.destination as! DriverDetailsViewController
                
                // Set the video property of the detail view controller
                driverDetailsVC.selectedDriver = selectedDriver.driver
                
            }
        }
    }
    
}


// MARK: - Driver ranking model delegate

extension DriversViewController: DriverRankingModelDelegate {
    func driversFetched(_ drivers: [DriverRankingItem]) {
        
        showIsLoading(isLoading: false)
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.DRIVER_CELL_ID, for: indexPath) as! DriverTableViewCell
        
        // Get title for current video
        let driver = self.drivers[indexPath.row]
        
        cell.setDetails(indexPath.item + 1, driver)
        
        // Return the cell for displaying
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.Segues.showDriverDetails, sender: nil)
    }
    
}
