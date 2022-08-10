//
//  DriverDetailsViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import UIKit

class DriverDetailsViewController: UIViewController {
    
    @IBOutlet weak var driverImageView: RoundedImageView!
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var driverHomeLabel: UILabel!
    @IBOutlet weak var driverBirthDateLabel: UILabel!
    @IBOutlet weak var driverNationalityLabel: UILabel!
    @IBOutlet weak var driverBirthPlaceLabel: UILabel!
    @IBOutlet weak var driverGpsEntered: UILabel!
    @IBOutlet weak var driverPodiumsLabel: UILabel!
    @IBOutlet weak var driverChampionshipsLabel: UILabel!
    @IBOutlet weak var driverCareerPointsLabel: UILabel!
    @IBOutlet weak var teamsTableView: UITableView!
    
    var selectedDriver: DriverInfo?
    
    var model = DriverDetailsModel()
    
    var teams = [DriverTeam]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set table view data source and delegate as the viewcontroller(self)
        teamsTableView.dataSource = self
        teamsTableView.delegate = self

        // Do any additional setup after loading the view.
        showPassedDetails()
        
        fetchDriverDetails()
    }
    
    func showPassedDetails() {
        // Hide tab bar
        self.tabBarController?.tabBar.isHidden = true
        
        guard selectedDriver != nil else {
            print("Passed driver is nil")
            return
        }
        
        // Show details
        driverImageView.loadImage(from: selectedDriver!.image ?? "")
        driverNameLabel.text = selectedDriver!.name
    }

    func fetchDriverDetails() {
        guard selectedDriver != nil else {
            print("Passed driver is nil")
            return
        }
        
        model.delegate = self
        model.getDriverDetails(driverId: selectedDriver!.id)
    }
    
    func showLoadedDetails(driverDetails: DriverDetails) {
        driverHomeLabel.text = driverDetails.country.name ?? "Not known"
        driverBirthDateLabel.text = driverDetails.birthdate
        driverNationalityLabel.text = driverDetails.nationality
        driverBirthPlaceLabel.text = driverDetails.birthplace
        driverGpsEntered.text = "\(driverDetails.grands_prix_entered ?? "0")"
        driverPodiumsLabel.text = "\(driverDetails.podiums)"
        driverChampionshipsLabel.text = String(driverDetails.world_championships)
        driverCareerPointsLabel.text = "\(driverDetails.career_points )"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Clear all fields
        driverHomeLabel.text = ""
        driverBirthDateLabel.text = ""
        driverNationalityLabel.text = ""
        driverBirthPlaceLabel.text = ""
        driverGpsEntered.text = ""
        driverPodiumsLabel.text = ""
        driverChampionshipsLabel.text = ""
        driverCareerPointsLabel.text = ""
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // Restore tab bar
        self.tabBarController?.tabBar.isHidden = false
    }
    
}



// MARK: - Driver details model delegate

extension DriverDetailsViewController: DriverDetailsModelDelegate {
    
    func driverDetailsFetched(_ driverDetails: [DriverDetails]) {
        guard driverDetails.count > 0 else {
            return
        }
        
        showLoadedDetails(driverDetails: driverDetails[0])
        
        teams = driverDetails[0].teams
        teamsTableView.reloadData()
    }
    
}



// MARK: - Table view methods

extension DriverDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.DRIVER_TEAM_CELL_ID, for: indexPath) as! DriverTeamTableViewCell
        
        let team = self.teams[indexPath.row]
        
        cell.setDetails(team)
        
        // Return the cell for displaying
        return cell
    }
    
}
