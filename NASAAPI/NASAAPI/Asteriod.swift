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
    var estimatedMileMin: Double?
    var estimatedMileMax: Double?
    
    
    init(asteriodDictionary: NSDictionary){
    
    guard let
        
      unwrappedAsteriodDictionary = asteriodDictionary as? NSDictionary,
      unwrappedName = asteriodDictionary["name"] as? String,
      unwrappedEstimatedDiameterDictionary = asteriodDictionary["estimated_diameter"] as? NSDictionary,
      unwrappedMiles = unwrappedEstimatedDiameterDictionary["miles"] as? NSDictionary,
      unwrapppedEstimatedDiameterMin = unwrappedMiles["estimated_diameter_min"] as? Double,
      unwrappedEstimatedDiameterMax = unwrappedMiles["estimated_diameter_max"] as? Double
      
    else {print("ERROR"); return}
       
      self.asteriodDictionary = unwrappedAsteriodDictionary
      self.name = unwrappedName
      self.estimatedMileMin = unwrapppedEstimatedDiameterMin
      self.estimatedMileMax = unwrappedEstimatedDiameterMax
    }

}
