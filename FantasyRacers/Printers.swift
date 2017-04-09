//
//  Printers.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 05/04/2017.
//  Copyright © 2017 Christoher Fonseka. All rights reserved.
//

import Foundation

struct Print
{
    static func scores(forDriver driver: [Driver], usingScoring scores: Scoring)
    {
        for driver in drivers.sorted(by: { scores.getScore(forDriver: $0) > scores.getScore(forDriver: $1) })
        {
            let score = scores.getScore(forDriver: driver)
            print ("\(score) -> \(driver)")
        }
    }
    
    static func scores(forTeams teams: [Team], usingScoring scores: Scoring)
    {
        for team in teams.sorted(by: { scores.getScore(forTeam: $0) > scores.getScore(forTeam: $1) })
        {
            let score = scores.getScore(forTeam: team)
            print ("\(score) -> \(team)")
        }
    }
    
    static func scores(forEntries entries: [FantasyEntry], usingRaceScore scores: Scoring)
    {
        Print.scores(forEntries: entries, usingRaceScores: [scores])
    }

    static func scores(forEntries entries: [FantasyEntry], usingRaceScores raceScores: [Scoring])
    {
        let score = { (entry: FantasyEntry) -> Int in
            var output = 0
            for raceScore in raceScores { output += raceScore.getScore(forEntry: entry) }
            return output
        }

        for entry in entries.sorted(by: { score($0) > score($1) })
        {
            print ("\(score(entry)) -> \(entry)")
        }
    }
}
