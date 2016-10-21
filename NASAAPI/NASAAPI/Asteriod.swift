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
      name = asteriodDictionary["name"] as? String,
      absoluteMagnitude = asteriodDictionary["absolute_magnitude_h"] as? Double,
      neoReference = asteriodDictionary["neo_reference_id"] as? String,
      estimatedMileMin = asteriodDictionary["estimated_diameter_min"] as? Double,
      estimatedMileMax = asteriodDictionary["estimated_diameter_max"] as? Double
      
    else {print("ERROR"); return}
        
      self.name = name
      self.absoluteMagnitude = absoluteMagnitude
      self.neoReference = neoReference
      self.estimatedMileMin = estimatedMileMin
      self.estimatedMileMax = estimatedMileMax
    }

}
