//
//  SeasonRacesViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 21/07/2022.
//

import UIKit
import XLPagerTabStrip

class SeasonRacesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var seasonsPopupButton: UIButton!
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    var model = RaceItemsModel()
    
    var races = [RaceItem]()
    
    var selectedYear: String = "2022"
    
    var racesDelegate: RacesViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPopupButton()
        
        // Set table view data source and delegate as the viewcontroller(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 120
        tableView.estimatedRowHeight = 120
        
        model.delegate = self
        
        // Previous races requires season
        selectedYear = Date().convertDate(withFormat: "YYYY")
        
        fetchSelectedYearDrivers()
    }
    
    
    func fetchSelectedYearDrivers() {
        
        showIsLoading(isLoading: true)
        
        // Initial network call
        model.fetchRaces(
            byId: nil,
            ofType: Constants.RaceTypes.PRACTICE_1,
            forSeason: selectedYear,
            raceDate: .none
        )
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
    
    
    // MARK: - Segue methods
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Make sure that a character was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        // Get a reference to the character that was tapped on
        let selectedRace = races[tableView.indexPathForSelectedRow!.row]
    
        // Get a reference to the detail view controller
        let detailViewController = segue.destination as! RaceDetailsViewController
        
        // Set the character property of the detail view controller
        detailViewController.raceItem = selectedRace
        
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

}


// MARK: -> XLPager Section

extension SeasonRacesViewController: IndicatorInfoProvider {
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Season Races")
    }
}


// MARK: - Driver ranking model delegate

extension SeasonRacesViewController: RaceItemsModelDelegate {
    func racesFetched(_ races: [RaceItem]) {
        
        self.races = races
        
        showIsLoading(isLoading: false)
        
        tableView.reloadData()
    }
}


// MARK: -> Table View Methods

extension SeasonRacesViewController: UITableViewDelegate, UITableViewDataSource {
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
