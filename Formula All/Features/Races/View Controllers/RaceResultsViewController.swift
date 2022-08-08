//
//  RaceResultsViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 08/08/2022.
//

import UIKit

class RaceResultsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model = RaceResultsModel()
    
    var drivers = [DriverRaceResult]()
    
    var selectedRace: RaceItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide tab bar
        self.tabBarController?.tabBar.isHidden = true
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // Ensure selected race passed is not nil
        guard selectedRace != nil else {
            print("Selected race passed is nil")
            return
        }
        
        // Set model delegate as self and init network call
        model.delegate = self
        model.fetchRaceResults(forRace: selectedRace!.id)
    }

    override func viewWillDisappear(_ animated: Bool) {
        // Restore tab bar
        self.tabBarController?.tabBar.isHidden = false
    }
    
}



// MARK: - Driver ranking model delegate

extension RaceResultsViewController: RaceResultsModelDelegate {
    func raceResultsFetched(_ driversResults: [DriverRaceResult]) {
        
        dump(driversResults)
        
        self.drivers = driversResults
        
        tableView.reloadData()
    }
    
}



// MARK: -> Table View Methods
extension RaceResultsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drivers.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.RACERS_TABLE_DRIVER_ID, for: indexPath) as! RaceResultsDriverTableViewCell
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.RACERS_TABLE_DRIVER_ID, for: indexPath) as! RaceResultsDriverTableViewCell
            
            // Get title for current race
            let race = self.drivers[indexPath.row - 1]

            // Configure the cell with the data
            cell.setDetails(race)

            // Return the cell for displaying
            return cell
        }

        
    }
}
