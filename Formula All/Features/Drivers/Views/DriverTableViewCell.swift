//
//  DriverTableViewCell.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import UIKit

class DriverTableViewCell: UITableViewCell {
    
    @IBOutlet weak var positionLabel: UILabel!
    
    @IBOutlet weak var driverImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
//    @IBOutlet weak var abbreviationLabel: UILabel!
    
    @IBOutlet weak var teamLabel: UILabel!
    
    @IBOutlet weak var pointsLabel: UILabel!
    
    var driverItem: DriverRankingItem?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setDetails(_ position: Int, _ passedDriver: DriverRankingItem) {
        
        // Clear previous values on reused cell
        self.driverImageView.image = nil
        
        self.positionLabel.text = ""
        self.nameLabel.text = ""
        self.teamLabel.text = ""
//        self.abbreviationLabel.text = ""
        self.pointsLabel.text = ""
        
        self.driverItem = passedDriver
        
        // Ensure that we the character object is not null to prevent crashes
        guard self.driverItem != nil else {
            return
        }
        
        // Set char vars
        self.positionLabel.text = String(position)
        self.nameLabel.text = driverItem?.driver?.name
//        self.abbreviationLabel.text = driverItem?.driver?.abbr
        self.teamLabel.text = driverItem?.team?.name
        self.pointsLabel.text = "\(driverItem?.points ?? "0") Points"
        
//        print("Points: \(driverItem?.points)")
        
        // Load image with custom class
        ImageLoader.loadImage(from: driverItem?.driver?.image ?? "", into: driverImageView)
        
    }

}
