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
        // TODO

        points += pointsForFinishing(forDriver: driver, atRace: race, usingResults: results)

        // Points for pole position (10)
        // Points for out qualifying team mate (5)
        // Points for moving up the field (3 per place)

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
                if (pos <= points.count)
                {
                    return points[pos - 1]
                }
        }

        return 0
    }

    static private func getResult(forDriver driver: Driver, atRace race: Location, usingResults results: [RaceResult]) -> RaceResult?
    {
        let matches = results.filter({ $0.driver == driver.name && $0.location == race })
        return matches.first
    }

}
