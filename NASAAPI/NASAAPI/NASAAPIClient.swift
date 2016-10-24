//
//  NASAAPIClient.swift
//  NASAAPI
//
//  Created by Flatiron School on 10/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation

class NASAAPIClient{


    class func getAsteriodInformationWith (startData: String, endData: String, completion: (NSArray) -> ()){
    
        var nasaArray = []
        
        let nasaURL = "https://api.nasa.gov/neo/rest/v1/feed?start_date=\(startData)&end_date=\(endData)&api_key=\(Secrets.nasaAPIKey)"
        
        let nsURL = NSURL(string: nasaURL)
        
        guard let unwrappedNSURL = nsURL else {print("THE NSURL DID NOT UNWRAP"); return}
        
        let request = NSURLRequest(URL: unwrappedNSURL)
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) { (data, response, error) in
            guard let unwrappedData = data else {print("DATA DID NOT UNWRAP"); return}
            
            let responseDictionary = try? NSJSONSerialization.JSONObjectWithData(unwrappedData, options: []) as! NSDictionary
            
            guard let unwrappedResponseDictionary = responseDictionary else {print("RESPONSE DICTIONARY DID NOT UNWRAP"); return}
            
            let nearEarthObjects = unwrappedResponseDictionary["near_earth_objects"] as? NSDictionary
            
            guard let unwrappedNearEarthObjects = nearEarthObjects else {print("NEAR EARTH OBJECTS DID NOT UNWRAP"); return}
            
            let startDateArray = unwrappedNearEarthObjects[startData] as? NSArray

            guard let unwrappedStartDateArray = startDateArray else {print("START DATE ARRAY DID NOT UNWRAP"); return}
            
            nasaArray = unwrappedStartDateArray 
            
            completion(nasaArray)
            
        }
        
        task.resume()
    
    }


}
