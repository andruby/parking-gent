//
//  Parking.swift
//  Parking Gent
//
//  Created by Andrew Fecheyr on 09/06/14.
//  Copyright (c) 2014 Andrew Fecheyr. All rights reserved.
//

import Foundation

class Parking {
    var name: String?
    var description: String?
    var availableCapacity: Int?
    var open: Bool?
    var full: Bool?
    var latitude: Double?
    var longitude: Double?
    
    init(data: NSDictionary) {
        name = data["name"] as? String
        description = data["description"] as? String
        availableCapacity = (data["availableCapacity"] as String).toInt()
    }
    
    class func fromJson(json: NSMutableData) -> [Parking] {
        // Convert the retrieved data in to an object through JSON deserialization
        //var err: NSError
        let parkingsArray: [NSDictionary] = NSJSONSerialization.JSONObjectWithData(json, options: NSJSONReadingOptions.MutableContainers, error: nil) as [NSDictionary]
        
        var parkings: [Parking] = []
        for data in parkingsArray {
            parkings.append(Parking(data: data))
        }
        return parkings
    }
}
