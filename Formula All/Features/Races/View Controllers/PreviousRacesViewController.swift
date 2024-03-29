//
//  PreviousRacesViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import UIKit
import XLPagerTabStrip

class PreviousRacesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var model = RaceItemsModel()
    
    var races = [RaceItem]()
    
    var racesDelegate: RacesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        
        model.delegate = self
        
        // Previous races requires season
        let currentYear = Date().convertDate(withFormat: "YYYY")
        
        model.fetchRaces(
            byId: nil,
            ofType: Constants.RaceTypes.PRACTICE_1,
            forSeason: currentYear,
            raceDate: .previous
        )
        
        showIsLoading(isLoading: true)
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
}


// MARK: -> XLPager Section

extension PreviousRacesViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Previous Races")
    }
}


// MARK: - Driver ranking model delegate

extension PreviousRacesViewController: RaceItemsModelDelegate {
    func racesFetched(_ races: [RaceItem]) {
        
        self.races = races
        
        showIsLoading(isLoading: false)
        
        tableView.reloadData()
    }
}


// MARK: -> Table View Methods

extension PreviousRacesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.RACE_CELL_ID, for: indexPath) as! RaceTableViewCell
        
        // Get title for current race
        let race = self.races[indexPath.row]
        
        cell.setDetails(race)
        
        // Return the cell for displaying
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Make sure that a character was selected
        guard tableView.indexPathForSelectedRow != nil else {
            print("Selected race item is nil")
            return
        }

        // Get a reference to the character that was tapped on
        let selectedRace = races[tableView.indexPathForSelectedRow!.row]
        
        racesDelegate?.navigateToDetailView(selectedRace: selectedRace)
    }
}
