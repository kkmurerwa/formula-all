//
//  RaceDetailsViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 26/07/2022.
//

import UIKit

class RaceDetailsViewController: UIViewController {

    @IBOutlet weak var raceTitleLable: UILabel!
    
    @IBOutlet weak var circuitNameLabel: UILabel!
    
    @IBOutlet weak var circuitLocationLabel: UILabel!
    
    @IBOutlet weak var raceLapsLabel: UILabel!
    
    @IBOutlet weak var raceDistanceLabel: UILabel!
    
    @IBOutlet weak var scheduleTableView: UITableView!
    
    var model = RaceItemsModel()
    
    var raceItem: RaceItem?
    
    var races = [RaceItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    func setUpViews() {
        
        // Set table view data source and delegate as the viewcontroller(self)
        scheduleTableView.dataSource = self
        scheduleTableView.delegate = self
        
        // Hide tab bar
        self.tabBarController?.tabBar.isHidden = true
        
        // Ensure raceitem is not null
        guard raceItem != nil else {
            print("Race Item is nil")
            return
        }
        
        dump("RaceItem: \(raceItem!)")
        
        // Show items
        raceTitleLable.text = raceItem!.competition.name
        circuitNameLabel.text = raceItem!.circuit.name
        
        circuitLocationLabel.text = "\(raceItem!.competition.location.city!), \(raceItem!.competition.location.country!)"
        
        raceLapsLabel.text = "\(raceItem!.laps.total ?? "0")"
        raceDistanceLabel.text = "\(raceItem!.distance ?? "0") km"
        
        model.delegate = self
        
        model.fetchRaces(
            forSeason: String(raceItem!.season),
            forCompetition: raceItem?.competition.id,
            raceDate: .none
        )
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        // Restore tab bar
        self.tabBarController?.tabBar.isHidden = false
    }
    
}



// MARK: - Driver ranking model delegate

extension RaceDetailsViewController: RaceItemsModelDelegate {
    func racesFetched(_ races: [RaceItem]) {
        
        dump(races)
        
        self.races = races
        
//        showIsLoading(isLoading: false)
        
        scheduleTableView.reloadData()
    }
}



// MARK: -> Table View Methods
extension RaceDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.RACE_SCHEDULE_ID, for: indexPath) as! ScheduleTableViewCell
        
        // Get title for current race
        let race = self.races[indexPath.row]
        
        // Configure the cell with the data
        cell.setDetails(race)
        
        // Return the cell for displaying
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
