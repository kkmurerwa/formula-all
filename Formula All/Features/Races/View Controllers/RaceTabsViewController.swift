//
//  TabsPageViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import UIKit
import XLPagerTabStrip

class RaceTabsViewController: ButtonBarPagerTabStripViewController {
    
    var selectedRace: RaceItem?
    
    override func viewDidLoad() {
        loadDesign()
        
        super.viewDidLoad()
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let nextRacesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.StoryBoardIDs.NEXT_RACES_ID) as! NextRacesViewController
        
        let previousRacesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.StoryBoardIDs.PREVIOUS_RACES_ID) as! PreviousRacesViewController
        
        let seasonRacesVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Constants.StoryBoardIDs.SEASON_RACES_ID) as! SeasonRacesViewController
        
        // Set self as delegate to all child screens
        nextRacesVC.racesDelegate = self
        previousRacesVC.racesDelegate = self
        seasonRacesVC.racesDelegate = self
        
        return [nextRacesVC, previousRacesVC, seasonRacesVC]
    }
    
    func loadDesign() {
        self.settings.style.buttonBarBackgroundColor = .white
        self.settings.style.buttonBarItemBackgroundColor = .systemBlue
        self.settings.style.selectedBarBackgroundColor = .white // Bottom selected bar
        self.settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 13)
        self.settings.style.selectedBarHeight = 4.0
        self.settings.style.buttonBarMinimumLineSpacing = 0
        self.settings.style.buttonBarItemTitleColor = .black
        self.settings.style.buttonBarItemsShouldFillAvailableWidth = true
        self.settings.style.buttonBarLeftContentInset = 0
        self.settings.style.buttonBarRightContentInset = 0
        self.settings.style.buttonBarMinimumInteritemSpacing = 0
        self.settings.style.buttonBarHeight = 1.0
        
        changeCurrentIndexProgressive = {(oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            
            guard changeCurrentIndex == true else {
                return
            }
            
            oldCell?.label.textColor = UIColor.white
            newCell?.label.textColor = UIColor.white
            
        }
        
    }
    
    // MARK: - Segue methods

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Make sure that a character was selected
        guard selectedRace != nil else {
            return
        }

        // Get a reference to the detail view controller
        let detailViewController = segue.destination as! RaceDetailsViewController

        // Set the character property of the detail view controller
        detailViewController.raceItem = selectedRace

    }
    
}

extension RaceTabsViewController: RacesViewControllerDelegate {
    
    func navigateToDetailView(selectedRace: RaceItem) {
        print("Navigation clicked")
        
        // Set the value to be passed to the detail view controller
        self.selectedRace = selectedRace
        
        performSegue(withIdentifier: Constants.Segues.showRaceDetails, sender: self)
    }
    
}
