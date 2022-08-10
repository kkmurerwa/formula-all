//
//  DriverTeamTableViewCell.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import UIKit

class DriverTeamTableViewCell: UITableViewCell {

    @IBOutlet weak var teamImageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamYearLabel: UILabel!
    
    var team: DriverTeam?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setDetails(_ selectedTeam: DriverTeam) {
        
        teamImageView.image = UIImage()
        teamNameLabel.text = ""
        teamYearLabel.text = ""
        
        self.team = selectedTeam
        guard self.team != nil else {
            return
        }
        
        teamImageView.loadImage(from: team!.team.logo)
        teamNameLabel.text = team!.team.name
        teamYearLabel.text = String(team!.season)
    }

}
