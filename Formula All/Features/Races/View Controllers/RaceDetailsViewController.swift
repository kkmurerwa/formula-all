//
//  RaceDetailsViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 26/07/2022.
//

import UIKit

class RaceDetailsViewController: UIViewController {

    
    var raceItem: RaceItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpViews()
    }
    
    func setUpViews() {
        // Hide tab bar
        self.tabBarController?.tabBar.isHidden = true
        
        // Ensure raceitem is not null
        guard raceItem != nil else {
            print("Race Item is nil")
            return
        }
        
        dump("RaceItem: \(raceItem!)")
        
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        // Restore tab bar
        self.tabBarController?.tabBar.isHidden = false
    }
    
}
