//
//  CircuitCollectionViewCell.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import UIKit

class CircuitTableViewCell: UITableViewCell {
    
    @IBOutlet weak var circuitImageView: UIImageView!
    
    @IBOutlet weak var circuitNameLabel: UILabel!
    
    @IBOutlet weak var competitionNameLabel: UILabel!
    
    var circuit: CircuitItem?
    
    func setDetails(_ passedCircuit: CircuitItem) {
        
        circuitImageView.image = UIImage()
        circuitNameLabel.text = ""
        competitionNameLabel.text = ""
        
        // Assign card value to global card variable
        self.circuit = passedCircuit
        
        // Ensure that we the character object is not null to prevent crashes
        guard self.circuit != nil else {
            return
        }
        
        circuitImageView.loadImage(from: circuit?.image ?? "")
        circuitNameLabel.text = circuit?.name
        competitionNameLabel.text = circuit?.competition.name ?? ""
        
    }
    
}
