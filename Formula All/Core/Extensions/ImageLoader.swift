//
//  ImageLoader.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import UIKit

extension UIImageView {
    
    func loadImage(from url: String) {
        
        // Save time by not fetching blank urls
        if url.isEmpty {
            self.image = UIImage()
            return
        }
        
        
        // Check image cache before downloading data
        if let cachedData = ImageCacheManager.getImageCache(url) {
            
            // Return the thumbnailImageView from cache
            self.image = UIImage(data: cachedData)
        } else {
            // Convert Url string to URL object
            let imageUrl = URL(string: url)
            
            // Get the shared url session object
            let session = URLSession.shared
            
            // Create Data task
            let dataTask = session.dataTask(with: imageUrl!) { (data, response, error) in
                
                if error == nil && data != nil {
                    // Check that downloaded URL matches the video thumbnail url
                    if imageUrl!.absoluteString != url {
                        // Video cell has been recycled for another video and no longer matches downloaded url
                        return
                    }
                    
                    ImageCacheManager.setImageCache(imageUrl!.absoluteString, data)
                    
                    // Set the image object to imageview in main thread
                    DispatchQueue.main.async {
                        self.image = UIImage(data: data!)
                    }
                }
                
            }
            
            // Initialize data task
            dataTask.resume()
            
        }
    }
    
}
