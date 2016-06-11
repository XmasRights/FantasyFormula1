//
//  Driver.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

func ==(lhs: Driver, rhs: Driver) -> Bool
{
    return lhs.name == rhs.name
}

struct Driver: CustomStringConvertible
{
    let name:  String
    let races: [Race]
    
    var description: String { return name }
    
    func getRaceResult(location: Location) -> Race?
    {
        for race in races
        {
            if race.location == location
            {
                return race
            }
        }
        return nil
    }
    
    func getValue (location: Location) -> Double?
    {
        if let race = getRaceResult(location)
        {
            return race.value
        }
        return nil
    }
    
    func getPoints (location: Location) -> Int?
    {
        if let race = getRaceResult(location)
        {
            return race.points
        }
        return nil
    }
}