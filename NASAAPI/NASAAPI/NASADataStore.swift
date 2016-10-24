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

        NASAAPIClient.getAsteriodInformationWith(startDate, endData: endData) { (nasaArray) in
    
            for singleDictionary in nasaArray{
            
                guard let unwrappedSingleDictionary = singleDictionary as? NSDictionary else {print("SINGLE DICTIONARY DID NOT UNWRAP"); return}
                
                let asteriodObject = Asteriod(asteriodDictionary: unwrappedSingleDictionary)
                
                self.asteriods.append(asteriodObject)
                
                print("********************************************")
                print(asteriodObject.name)
                print(asteriodObject.estimatedMileMax)
                print(asteriodObject.estimatedMileMin)
                print("********************************************")
            
            }
            completion(self.asteriods)
        }

    }
}