//
//  Simulator.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 05/04/2017.
//  Copyright © 2017 Christoher Fonseka. All rights reserved.
//

import Foundation

struct Simulator
{
    let drivers:  [Driver]
    let teams:    [Team]
    
    func getEntries(usingFilter filter: (FantasyEntry) -> Bool) -> [FantasyEntry]
    {
        print ("Generating Team Lineups")
        let teamLineups = teams.uniquePermutations(withPredicate: { $0.count == 3 })
        print ("... found \(teamLineups.count) combinations\n")
        
        print ("Generating Driver Lineups")
        let driverLineups = drivers.uniquePermutations(withPredicate: { $0.count == 3 })
        print ("... found \(driverLineups.count) combinations\n")
        
        print ("Generating Fantasy Entries")
        let entries = product(ofTeams: teamLineups, andDrivers: driverLineups, usingFilter: filter)
        print ("... Finished!\n\n")
        return entries
    }
    
    private func product(ofTeams teams: [[Team]], andDrivers drivers: [[Driver]], usingFilter filter: (FantasyEntry) -> Bool) -> [FantasyEntry]
    {
        var output = [FantasyEntry]()
        for team in teams
        {
            for driver in drivers
            {
                let entry = FantasyEntry(drivers: driver, teams: team)
                if (filter (entry)) { output.append(entry) }
            }
        }
        return output
    }
}
