//
//  DriverDetailsModel.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/08/2022.
//

import Foundation

class DriverDetailsModel {
    
    var delegate: DriverDetailsModelDelegate?
    
    func getDriverDetails(driverId: Int) {
        // Create a URL object
        let url = URL(string: Urls.DRIVER_DETAILS(id: driverId))
        
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
                
                let response = try decoder.decode(DriverDetailsResponse.self, from: data!)
                
                // Ensure response.items is not nill to prevent crashes
                if response.items != nil {
                    
                    // Call the main thread to pass the function through it
                    DispatchQueue.main.async {
                        
                        // Call the "driversFetched" method of the delegate
                        self.delegate?.driverDetailsFetched(response.items!)
                    }
                
                }
                
            } catch {
                
                // Print error message
                print("The following error was encountered: \(error)")
            }
            
            
        }.resume()
    }
    
}
