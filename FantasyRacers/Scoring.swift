//
//  Scoring.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 04/04/2017.
//  Copyright © 2017 Christoher Fonseka. All rights reserved.
//

import Foundation

struct Scoring
{
    let race: Location
    
    init(race: Location, allResults: [RaceResult], allDrivers: [Driver], allTeams: [Team])
    {
        self.race = race
        calculateScores (forDrivers: allDrivers, usingResults: allResults)
        calculateScores (forTeams:   allTeams,   usingResults: allResults, andDriverData: allDrivers)
    }
    
    func getScore(forDriver driver: Driver) -> Int
    {
        guard let score = driverScores[driver.name] else { print("No score for \(driver.name)"); return 0 }
        return score
    }
    
    func getScore(forTeam team: Team) -> Int
    {
        guard let score = teamScores[team.name] else { print("No score for \(team.name)"); return 0 }
        return score
    }
    
    // =========================================================================
    // MARK: Results
    // =========================================================================
    
    private func getResults(forRace race: Location, usingResults results: [RaceResult]) -> [RaceResult]
    {
        return results.filter { return $0.location == race }
    }
    
    private func getResult(forDriver driver: DriverName, usingResults results: [RaceResult]) -> RaceResult?
    {
        return results.filter({ return $0.driver == driver }).first
    }
    
    private func getDrivers(inTeam team: Team, usingDriverData driverData: [Driver]) -> [Driver]
    {
        return driverData.filter({ $0.team == team.name })
    }
    
    // =========================================================================
    // MARK: Score Calculators
    // =========================================================================
    
    private var driverScores = [DriverName : Int]()
    private var teamScores   = [TeamName   : Int]()
    
    private mutating func calculateScores (forDrivers drivers: [Driver], usingResults results: [RaceResult])
    {
        for driver in drivers
        {
            calculateScore(forDriver: driver, usingResults: results)
        }
    }
    
    private mutating func calculateScore (forDriver driver: Driver, usingResults results: [RaceResult])
    {
        guard let driverResult = getResult(forDriver: driver.name, usingResults: results)
            else { print("No result for \(driver.name)"); return }
        
        var score = 0
        
        score += finishingPoints             (forDriver: driver, usingResult:  driverResult)
        score += polePositionPoints          (forDriver: driver, usingResult:  driverResult)
        score += outqualifyingTeammatePoints (forDriver: driver, usingResults: results)
        score += gainedPositionPoints        (forDriver: driver, usingResult:  driverResult)
        
        driverScores[driver.name] = score
    }
    
    private mutating func calculateScores (forTeams teams: [Team], usingResults results: [RaceResult], andDriverData driverData: [Driver])
    {
        for team in teams
        {
            calculateScore(forTeam: team, usingResults: results, andDriverData: driverData)
        }
    }
    
    private mutating func calculateScore (forTeam team: Team, usingResults results: [RaceResult], andDriverData driverData: [Driver])
    {
        let drivers = getDrivers(inTeam: team, usingDriverData: driverData)
        assert(drivers.count == 2, "Incorrect number of drivers in \(team.name)")
        
        var score = 0
        for driver in drivers
        {
            guard let result = getResult(forDriver: driver.name, usingResults: results)
                else { print("No result for \(driver.name)"); return }
            
            score += finishingPoints(forDriver: driver, usingResult: result)
        }
        
        teamScores[team.name] = score
    }
    
    // =========================================================================
    // MARK: Point methods
    // =========================================================================
    
    private func finishingPoints(forDriver driver: Driver, usingResult result: RaceResult) -> Int
    {
        let points = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
        
        switch result.racePosition
        {
            case .Finished(let position):
                if (position <= points.count) { return points[position - 1] }
                else { return 0 }
            
            case .DNF:
                return 0
        }
    }
    
    private func polePositionPoints(forDriver driver: Driver, usingResult result: RaceResult) -> Int
    {
        switch result.qulifyingPosition
        {
            case .Finished(let position):
                return (position == 1 ? 10 : 0)
                
            case .DNF:
                return 0
        }
    }
    
    private func outqualifyingTeammatePoints(forDriver driver: Driver, usingResults results: [RaceResult]) -> Int
    {
        guard let driverResult = getResult(forDriver: driver.name, usingResults: results)
            else { print("No result for \(driver.name)"); return 0 }
        
        guard let teammateResult = getResult(forDriver: driver.teammate, usingResults: results)
            else { print("No result for \(driver.teammate)"); return 0 }
        
        switch driverResult.qulifyingPosition
        {
            case .Finished(let driverPosition):
                switch teammateResult.qulifyingPosition
                {
                    case .Finished(let teammatePosition):
                        return (driverPosition < teammatePosition ? 5 : 0)
                        
                    case .DNF:
                        return 5
                }
                
            case .DNF:
                return 0
        }
    }
    
    private func gainedPositionPoints(forDriver driver: Driver, usingResult result: RaceResult) -> Int
    {
        switch result.qulifyingPosition
        {
            case .Finished(let qualiPos):
                switch result.racePosition
                {
                    case .Finished(let racePos):
                        if (racePos < qualiPos)
                        {
                            return (qualiPos - racePos) * 3
                        }
                        else
                        {
                            return 0
                        }
                        
                    case .DNF:
                        return 0
                }
            case .DNF:
                return 0
        }
    }

}
