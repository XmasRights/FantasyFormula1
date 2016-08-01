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
    
    static func getTotalValue (_ drivers: [Driver], location: Location) -> Double
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
    
    static func getTotalPoints (_ drivers: [Driver], location: Location) -> Int
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
    
    func getTopTeams(_ location: Location, top: Int = 5, teamValue: Double = 0.0, teamSize: Int = 3) -> [[Driver]]
    {
        let teams = drivers.uniquePermutations(teamValue, withMaxSize: teamSize)
        
        let sorted = teams.sorted(isOrderedBefore: { Database.getTotalPoints($0, location: location) >  Database.getTotalPoints($1, location: location) })
        
        
        return Array(sorted.prefix(upTo: top))
    }
}
