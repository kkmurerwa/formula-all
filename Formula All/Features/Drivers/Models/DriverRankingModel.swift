//
//  DriverRankingModel.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import Foundation

class DriverRankingModel {
    
    var delegate: DriverRankingModelDelegate?
    
    func getDriverRanking(year: String) {
        
        print("Get episodes method was called")
        
        // Create a URL object
        let url = URL(string: Urls.DRIVER_RANKINGS_URL(forYear: year))
        
        // Make sure url has a value
        guard url != nil  else {
            print("URL is nil")
            return
        }
        
        // Create a URL Session
        let session = URLSession.shared
        
        // Create request to add headers
        let request = Urls.API_REQUEST(url: url!)
        
        // Make sure request has a value
        guard request != nil  else {
            print("URLRequest is nil")
            return
        }
        
        // Create a data task from the URLSession object and initialize it
        session.dataTask(with: request!) { (data, response, error) in
            
            // Check if there were errors
            if error != nil || data == nil {
                return
            }
            
            do {
                
                // Parse the data into driverrankingitem objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(DriverRankingResponse.self, from: data!)
                
                // Ensure response.items is not nill to prevent crashes
                if response.items != nil {
                    
                    // Call the main thread to pass the function through it
                    DispatchQueue.main.async {
                        
                        // Call the "driversFetched" method of the delegate
                        self.delegate?.driversFetched(response.items!)
                    }
                
                }
                
            } catch {
                
                // Print error message
                print("The following error was encountered: \(error)")
            }
            
            
        }.resume()
        
    }
    
}
