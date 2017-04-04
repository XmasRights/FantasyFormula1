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
    static func points(forDriver driver: Driver, atRace race: Location, usingResults results: [RaceResult]) -> Int
    {
        var points = 0;

        points += pointsForFinishing             (forDriver: driver, atRace: race, usingResults: results)
        points += pointsForPole                  (forDriver: driver, atRace: race, usingResults: results)
        points += pointsForOutqualifyingTeammate (forDriver: driver, atRace: race, usingResults: results)
        points += pointsForGainingPositions      (forDriver: driver, atRace: race, usingResults: results)

        return points
    }

    static private func pointsForFinishing(forDriver driver: Driver, atRace race: Location, usingResults results: [RaceResult]) -> Int
    {
        let points = [25, 18, 15, 12, 10, 8, 6, 4, 2, 1]
        guard let result = getResult(forDriver: driver, atRace: race, usingResults: results)
            else { print ("Could not find result for \(driver) at \(race.rawValue))"); return 0 }

        switch result.racePosition
        {
            case .DNF:
                return 0

            case .Finished(let pos):
                if (pos <= points.count) { return points[pos - 1] }
        }

        return 0
    }

    static private func pointsForPole(forDriver driver: Driver, atRace race: Location, usingResults results: [RaceResult]) -> Int
    {
        guard let result = getResult(forDriver: driver, atRace: race, usingResults: results)
            else { print ("Could not find result for \(driver) at \(race.rawValue))"); return 0 }

        switch result.qulifyingPosition
        {
            case .Finished(let position) where position == 1:
                return 10

            default:
                return 0
        }
    }

    static private func pointsForOutqualifyingTeammate(forDriver driver: Driver, atRace race: Location, usingResults results: [RaceResult]) -> Int
    {
        guard let result = getResult(forDriver: driver, atRace: race, usingResults: results)
            else { print ("Could not find result for \(driver) at \(race.rawValue))"); return 0 }

        guard let teammateResult = getResult(forDriver: driver.teammate, atRace: race, usingResults: results)
            else { print ("Could not find result for \(driver.teammate) at \(race.rawValue))"); return 0 }

        switch result.qulifyingPosition
        {
            case .Finished(let driverPosition):
                switch teammateResult.qulifyingPosition
                {
                    case .Finished(let teammatePosition):
                        return (driverPosition < teammatePosition ? 5 : 0)

                    default:
                        return 5
                }

            default:
                return 0
            }
    }

    static private func pointsForGainingPositions(forDriver driver: Driver, atRace race: Location, usingResults results: [RaceResult]) -> Int
    {
        guard let result = getResult(forDriver: driver, atRace: race, usingResults: results)
            else { print ("Could not find result for \(driver) at \(race.rawValue))"); return 0 }

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

    static private func getResult(forDriver driver: Driver, atRace race: Location, usingResults results: [RaceResult]) -> RaceResult?
    {
        return getResult(forDriver: driver.name, atRace: race, usingResults: results)
    }

    static private func getResult(forDriver driver: DriverName, atRace race: Location, usingResults results: [RaceResult]) -> RaceResult?
    {
        let matches = results.filter({ $0.driver == driver && $0.location == race })
        return matches.first
    }

}
