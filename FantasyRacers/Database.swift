//
//  Database.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

struct Database
{
    let drivers : [Driver]
    
    init (drivers: [Driver])
    {
        self.drivers = drivers
    }
    
    static func getTotalValue (drivers: [Driver], location: Location) -> Double
    {
        var total = 0.0
        for driver in drivers
        {
            if let value = driver.getValue(location)
            {
                total += value
            }
        }
        return total
    }
    
    static func getTotalPoints (drivers: [Driver], location: Location) -> Int
    {
        var total = 0
        for driver in drivers
        {
            if let points = driver.getPoints(location)
            {
                total += points
            }
        }
        return total
    }
}