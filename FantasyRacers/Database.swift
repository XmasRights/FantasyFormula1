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
    
    func getRacePoints(location: Location) -> [(Driver, Int)]
    {
        var output = [(Driver, Int)]()

        for driver in drivers
        {
            for race in driver.races
            {
                if race.location == location
                {
                    let points = race.points
                    
                    output.append( (driver, points) )
                    break;
                }
            }
        }
        return output
    }
    
    func getRaceValues(location: Location) -> [(Driver, Double)]
    {
        var output = [(Driver, Double)]()
        
        for driver in drivers
        {
            for race in driver.races
            {
                if race.location == location
                {
                    let value = race.value
                    
                    output.append( (driver, value) )
                    break;
                }
            }
        }
        return output
    }
    
}