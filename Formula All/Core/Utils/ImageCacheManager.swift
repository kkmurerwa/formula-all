//
//  ImageCacheManager.swift
//  Formula All
//
//  Created by Kenneth Murerwa on 09/07/2022.
//

import Foundation

class ImageCacheManager {
    
    static var cache = [String:Data]()
    
    static func setImageCache(_ url: String, _ data: Data?) {
        
        // Store the image data and use the url as the key
        cache[url] = data
        
    }
    
    static func getImageCache(_ url: String) -> Data? {
        
//        do {
//            if let imageData = try cache[url] {
//                return imageData
//            }
//            
//            return nil
//        } catch {
//
//        }
        
        return cache[url]
        
    }
    
}
