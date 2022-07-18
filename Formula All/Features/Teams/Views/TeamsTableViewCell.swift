//
//  TeamsTableViewCell.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 18/07/2022.
//

import UIKit

class TeamsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var teamLogoImage: RoundedImageView!
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var teamNameLabel: UILabel!
    
    @IBOutlet weak var teamPointsLabel: UILabel!
    
    var teamItem: TeamRankingItem?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setDetails(_ passedTeam: TeamRankingItem) {
        
        // Clear from reused cell
        teamLogoImage.image = UIImage()
        positionLabel.text = ""
        teamNameLabel.text = ""
        teamPointsLabel.text = ""
        
        // Set team item values and check for nulls
        self.teamItem = passedTeam
        
        guard self.teamItem != nil  else {
            return
        }
        
        // Set new values for cell items
        teamLogoImage.loadImage(from: passedTeam.team.logo)
        
        positionLabel.text = String(passedTeam.position)
        teamNameLabel.text = passedTeam.team.name
        teamPointsLabel.text = "\(passedTeam.points ?? 0) points"
    }
}
