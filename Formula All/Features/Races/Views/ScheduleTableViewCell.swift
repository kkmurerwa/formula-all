//
//  ScheduleTableViewCell.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 08/08/2022.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    var race: RaceItem?
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var monthLabel: UILabel!
    
    @IBOutlet weak var raceTitleLabel: UILabel!
    
    @IBOutlet weak var raceDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetails(_ race: RaceItem) {
        // Clear text labels
        dateLabel.text = ""
        monthLabel.text = ""
        raceTitleLabel.text = ""
        raceDescLabel.text = ""
        
        
        // Set value of race and guard against null
        self.race = race
        guard self.race != nil else {
            return
        }
        
        // Fill data
        dateLabel.text = self.race!.date.convertDate(withFormat: "dd")
        monthLabel.text = self.race!.date.convertDate(withFormat: "MMM").uppercased()
        
        raceTitleLabel.text = self.race!.type
        
        switch self.race!.status {
        case "Scheduled":
            // Get time of race
            let time = self.race!.date.convertDate(withFormat: "HH:mm")
            
            raceDescLabel.text = time
            
        case "Cancelled":
            raceDescLabel.text = "Race Canceled"
        default:
            raceDescLabel.text = "Race results"
        }
    }
    
}
