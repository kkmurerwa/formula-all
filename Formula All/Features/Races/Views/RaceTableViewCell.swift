//
//  RaceTableViewCell.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 23/07/2022.
//

import UIKit

class RaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var datesLabel: UILabel!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var raceRoundLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var grandPrixLabel: UILabel!
    
    var race: RaceItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    func setDetails(_ race: RaceItem) {
        // Clear text labels
        datesLabel.text = ""
        monthLabel.text = ""
        raceRoundLabel.text = ""
        countryLabel.text = ""
        grandPrixLabel.text = ""
        
        self.race = race
        
        guard self.race != nil else {
            return
        }
        
        // Get Month
        monthLabel.text = self.race!.date.convertDate(withFormat: "MMM").uppercased()
        
        // Get start and end dates
        let startDate = self.race!.date.convertDate(withFormat: "dd")
        let endDate = self.race!.date.addToDate(byDays: 2)!.convertDate(withFormat: "dd")

        datesLabel.text = "\(startDate) - \(endDate)"
        
        raceRoundLabel.text = self.race!.competition.location.country
        countryLabel.text = self.race!.competition.name
        grandPrixLabel.text = self.race!.circuit.name
    }
}
