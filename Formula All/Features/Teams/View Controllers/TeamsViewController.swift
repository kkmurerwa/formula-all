//
//  TeamsViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 18/07/2022.
//

import UIKit

class TeamsViewController: UIViewController {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var seasonPopupButton: UIButton!
    
    var model = TeamRankingModel()
    
    var teams = [TeamRankingItem]()
    
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
        
        fetchSelectedYearTeams()
        
        // Set up refreshing
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshDrivers), for: .valueChanged)
        
        // Link view to refresh control
        tableView.refreshControl = refreshControl
        
    }
    
    @objc func refreshDrivers(refreshControl: UIRefreshControl) {
        fetchSelectedYearTeams()
        
        // End refreshing
        refreshControl.endRefreshing()
    }
    
    func fetchSelectedYearTeams() {
        
        showIsLoading(isLoading: true)
        
        // Initial network call
        model.getTeamRankings(year: "\(selectedYear)")
    }

    func setPopupButton() {
        
        let optionClosure = {(action: UIAction) in
            
            self.showIsLoading(isLoading: true)
            
            self.selectedYear = action.title

            self.fetchSelectedYearTeams()
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
        
        seasonPopupButton.menu = UIMenu(children: optionsArray)
        
        seasonPopupButton.showsMenuAsPrimaryAction = true
        seasonPopupButton.changesSelectionAsPrimaryAction = true
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


// MARK: - Driver ranking model delegate

extension TeamsViewController: TeamRankingModelDelegate {
    
    func teamsFetched(_ teams: [TeamRankingItem]) {
        showIsLoading(isLoading: false)
        
        self.teams = teams
        
        tableView.reloadData()
    }
}

// MARK: - Table view methods

extension TeamsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.TEAM_CELL_ID, for: indexPath) as! TeamsTableViewCell
        
        // Get title for current video
        let team = self.teams[indexPath.row]
        
        cell.setDetails(team)
        
        // Return the cell for displaying
        return cell
    }
    
}

