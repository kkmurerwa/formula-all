//
//  CircuitsViewController.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 17/07/2022.
//

import UIKit

class CircuitsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = CircuitsModel()
    
    var circuits = [CircuitItem]()
    
    let margin: CGFloat = 10

    override func viewDidLoad() {
        super.viewDidLoad()

        // Assign the view controller as the delegate and data source for the collection view
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set model delegate as viewcontroller(self)
        model.delegate = self
        
        // Fetch circuits
        model.getCircuits()
  
    }

}


// MARK: - Driver ranking model delegate

extension CircuitsViewController: CircuitsModelDelegate {
    
    func circuitsFetched(_ circuits: [CircuitItem]) {
        self.circuits = circuits
        
        tableView.reloadData()
    }
    
}


// MARK: - UICollectionView Protocol Methods

extension CircuitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circuits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Get a CardCollectionViewCell object
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.TableViewCells.CIRCUIT_CELL_ID, for: indexPath) as! CircuitTableViewCell
        
        // Get the card that the collection view is trying to display
        let circuit = circuits[indexPath.row]
        
        // Set the card for the cell
        cell.setDetails(circuit)
        
        return cell
    }
    
    
}
