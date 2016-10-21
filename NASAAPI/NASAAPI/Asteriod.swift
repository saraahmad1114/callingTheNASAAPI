//
//  Asteriod.swift
//  NASAAPI
//
//  Created by Flatiron School on 10/20/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation


class Asteriod {

    var name: String?
    var absoluteMagnitude: Double?
    var neoReference: String?
    var estimatedMileMin: Double?
    var estimatedMileMax: Double?
    
    
    init(name: String, absoluteMagnitude: Double, neoReference: String, estimatedMileMin: Double, estimatedMileMax: Double){
        self.name = name
        self.absoluteMagnitude = absoluteMagnitude
        self.neoReference = neoReference
        self.estimatedMileMin = estimatedMileMin
        self.estimatedMileMax = estimatedMileMax
    }

}
