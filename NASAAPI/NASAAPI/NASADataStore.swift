//
//  NASADataStore.swift
//  NASAAPI
//
//  Created by Flatiron School on 10/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class NASADataStore{

    var asteriods: [Asteriod] = []
    
    static let sharedInstance = NASADataStore()
    private init() {}
    
    func getAsteriodInformationWithCompletion (startDate: String, endData: String, completion: (NSArray)->()){
        
        NASAAPIClient.getAsteriodInformationWith(startDate, endData: endData) { (nasaDictionary) in
            
            let nearEarthObjects = nasaDictionary["near_earth_objects"] as? NSDictionary
            
            guard let unwrappedNearEarthObjects = nearEarthObjects else {print("near earth objects did not unwrap"); return}
            
            let date = unwrappedNearEarthObjects[startDate] as? NSArray
            
            guard let unwrappedDate = date else {print("DATE DID NOT UNWRAP"); return}
            
            for singleDictionary in unwrappedDate {
                let singleDictionary = singleDictionary as? NSDictionary
                guard let unwrappedSingleDictionary = singleDictionary else {print("SINGLE DICTIONARY DID NOT UNWRAP"); return}
//let neoReferenceId = unwrappedSingleDictionary["neo_reference_id"] as? String
//guard let unwrappedNeoReferenceId = neoReferenceId else {print("Neo Reference id did not unwrap"); return}
//let name = unwrappedSingleDictionary["name"] as? String
//guard let unwrappedName = name else {print("NAME DID NOT UNWRAP"); return}
//let absoluteMagnitudeH = unwrappedSingleDictionary["absolute_magnitude_h"] as? Double
//guard let unwrappedAbsoluteMagnitude = absoluteMagnitudeH else {print("ABSOLUTE MAGNITUDE DID NOT UNWRAP"); return}
//let estimatedDiameter = unwrappedSingleDictionary["estimated_diameter"] as? NSDictionary
//guard let unwrappedEstimatedDiameter = estimatedDiameter else {print("ESTIMATED DIAMETER DID NOT UNWRAP"); return}
//let estimatedMiles = unwrappedEstimatedDiameter["miles"] as? NSDictionary
//guard let unwrappedEstimatedMiles = estimatedMiles else {print("ESTIMATED MILES DICTIONARY DID NOT WORK"); return}
//let estimatedDiameterMin = unwrappedEstimatedMiles["estimated_diameter_min"] as? Double
//                
//guard let unwrappedestimatedDiameterMin = estimatedDiameterMin else {print("DID NOT UNWRAP"); return}
//                
//let estimatedDiameterMax = unwrappedEstimatedMiles["estimated_diameter_max"] as? Double
               
// guard let unwrappedestimatedDiameterMax = estimatedDiameterMax else {print("DID NOT UNWRAP"); return}
//                let asteriodObject = Asteriod.(name: unwrappedName, absoluteMagnitude: unwrappedAbsoluteMagnitude, neoReference: unwrappedNeoReferenceId, estimatedMileMin: unwrappedestimatedDiameterMin, estimatedMileMax: unwrappedestimatedDiameterMax)
                
                let asteriodObject = Asteriod.init(asteriodDictionary: unwrappedSingleDictionary)
                print("************************************************************")
                print(asteriodObject.name)
                print(asteriodObject.neoReference)
                print(asteriodObject.absoluteMagnitude)
                print(asteriodObject.estimatedMileMin)
                print(asteriodObject.estimatedMileMax)
                print("************************************************************")
                self.asteriods.append(asteriodObject)
                completion(self.asteriods)
            }
            
            
        }
    
    }


}
