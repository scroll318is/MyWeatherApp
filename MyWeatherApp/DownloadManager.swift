//
//  DownloadManager.swift
//  MyWeatherApp
//
//  Created by Stoyan Yordanov Kostov on 10/23/15.
//  Copyright © 2015 com.kostov. All rights reserved.
//

import Foundation

class DownloadManager {
    var urlString = URL_BASE + API_KEY
//    static let sharedInstance = DownloadManager()
    
    func downloadDataForCity(city: String, completion: DownloadComplete) {
        let session = NSURLSession.sharedSession()
        session.configuration.timeoutIntervalForRequest = 30.0
        session.configuration.timeoutIntervalForResource = 60.0
        
        
        let url = NSURL(string: urlString)!
        session.dataTaskWithURL(url) { (data: NSData?, response:NSURLResponse?, error: NSError?) -> Void in
            
            if let err = error {
                completion(nil, error: err)
            }
            
            if let responseData = data {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    if let dict = json as? Dictionary<String, AnyObject> {
                        completion(dict, error: nil)
                    }
                } catch {
                    print("Could not serialize")
                }
            }
            }.resume()
    }
}
