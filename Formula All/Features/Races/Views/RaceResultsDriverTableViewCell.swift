//
//  RaceDriverTableViewCell.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 08/08/2022.
//

import UIKit

class RaceResultsDriverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var driverPositionLabel: UILabel!
    @IBOutlet weak var driverNameLabel: UILabel!
    @IBOutlet weak var driverGridNumberLabel: UILabel!
    @IBOutlet weak var pitStopsLabel: UILabel!
    @IBOutlet weak var lapsCompletedLabel: UILabel!
    @IBOutlet weak var driverTimeLabel: UILabel!
    
    var driver: DriverRaceResult?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDetails(_ driver: DriverRaceResult) {
        // Clear table view items
        driverPositionLabel.text = ""
        driverNameLabel.text = ""
        driverGridNumberLabel.text = ""
        pitStopsLabel.text = ""
        lapsCompletedLabel.text = ""
        driverTimeLabel.text = ""
        
        // Set value and check for nil
        self.driver = driver
        guard self.driver != nil else {
            return
        }
        
        // Show values
        driverPositionLabel.text = String(driver.position)
        driverNameLabel.text = driver.driver.name
        driverGridNumberLabel.text = driver.grid
        pitStopsLabel.text = String(driver.pits)
        lapsCompletedLabel.text = String(driver.laps)
        driverTimeLabel.text = driver.time
    }
    
}
