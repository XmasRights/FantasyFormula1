//
//  Database.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

func ==(lhs: DriverPoint, rhs: DriverPoint) -> Bool
{
    return lhs.driver.name == rhs.driver.name
}

func ==(lhs: DriverValue, rhs: DriverValue) -> Bool
{
    return lhs.driver.name == rhs.driver.name
}

struct DriverPoint
{
    let driver: Driver
    let points: Int
}

struct DriverValue
{
    let driver: Driver
    let value:  Double
}


struct Database
{
    let drivers : [Driver]
    
    init (drivers: [Driver])
    {
        self.drivers = drivers
    }
    
    func getRacePoints(location: Location) -> [DriverPoint]
    {
        var output = [DriverPoint]()

        for driver in drivers
        {
            for race in driver.races
            {
                if race.location == location
                {
                    let points = race.points
                    
                    output.append(DriverPoint(driver: driver, points: points))
                    break;
                }
            }
        }
        return output
    }
    
    func getRaceValues(location: Location) -> [DriverValue]
    {
        var output = [DriverValue]()
        
        for driver in drivers
        {
            for race in driver.races
            {
                if race.location == location
                {
                    let value = race.value
                    
                    output.append(DriverValue(driver: driver, value: value))
                    break;
                }
            }
        }
        return output
    }
    
}