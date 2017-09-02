//
//  Scoring_v2.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 02/09/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

struct Score
{
    static func score(team: Team, at race: Location) -> Int
    {
        let data = DataService.shared
        let drivers = data.driversIn(team: team)
        return drivers.reduce(0) { $0 + score(for: $1, at: race) }
    }
    
    static func score(for driver: Driver, at race: Location) -> Int
    {
        return [finishingPoints     (for: driver, at: race),
                polePoints          (for: driver, at: race),
                outqualifyingPoints (for: driver, at: race),
                gainedPositionPoints(for: driver, at: race)].reduce(0, +)
    }
    
    private static func finishingPoints(for driver: Driver, at location: Location) -> Int
    {
        let points = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
        
        let result = raceResult(for: driver, at: location)
        switch result.racePosition
        {
            case .Finished(let position) where position <= points.count:
                return points[position - 1]
    
            default:
                return 0
        }
    }
    
    private static func polePoints(for driver: Driver, at location: Location) -> Int
    {
        let result = raceResult(for: driver, at: location)
        switch result.qualifyingPosition
        {
            case .Finished(let position) where position == 1:
                return 10
            
            default:
                return 0
        }
    }
    
    private static func outqualifyingPoints(for driver: Driver, at location: Location) -> Int
    {
        guard let teammate = Driver(name: driver.teammate)
            else { preconditionFailure("Could not find teammate for \(driver)") }
        
        let driverResult   = raceResult(for: driver,   at: location)
        let teammateResult = raceResult(for: teammate, at: location)
        
        switch (driverResult.qualifyingPosition, teammateResult.qualifyingPosition)
        {
            case (.Finished(let a), .Finished(let b)) where a < b:
                return 5
            
            case (.Finished(_), .DNF):
                return 5
            
            default:
                return 0
        }
    }
    
    private static func gainedPositionPoints(for driver: Driver, at location: Location) -> Int
    {
        let result = raceResult(for: driver, at: location)
        
        switch (result.qualifyingPosition, result.racePosition)
        {
        case (.Finished(let quali), .Finished(let result)):
            return (result < quali) ? (quali - result) * 3 : 0
            
        default:
            return 0
        }
    }
    
    private static func raceResult(for driver: Driver, at location: Location) -> RaceResult
    {
        guard let result = RaceResult(driver: driver.name, location: location)
            else { preconditionFailure("No result for \(driver.name) at \(location)") }
        return result
    }
}
