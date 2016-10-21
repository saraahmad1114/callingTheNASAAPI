//
//  Asteriod.swift
//  NASAAPI
//
//  Created by Flatiron School on 10/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Asteriod {

    var asteriodDictionary: NSDictionary?
    var name: String?
    var absoluteMagnitude: Double?
    var neoReference: String?
    var estimatedMileMin: Double?
    var estimatedMileMax: Double?
    
    
    init(asteriodDictionary: NSDictionary){
    
    guard let
      unwrappedName = asteriodDictionary["name"] as? String,
      unwrappedAbsoluteMagnitude = asteriodDictionary["absolute_magnitude_h"] as? Double,
      unwrappedNeoReference = asteriodDictionary["neo_reference_id"] as? String,
      unwrappedEstimatedMileMin = asteriodDictionary["estimated_diameter_min"] as? Double,
      unwrappedEstimatedMileMax = asteriodDictionary["estimated_diameter_max"] as? Double
      
    else {print("ERROR"); return}
        
      self.name = unwrappedName
      self.absoluteMagnitude = unwrappedAbsoluteMagnitude
      self.neoReference = unwrappedNeoReference
      self.estimatedMileMin = unwrappedEstimatedMileMin
      self.estimatedMileMax = unwrappedEstimatedMileMax
    }

}
