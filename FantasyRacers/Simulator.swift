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
    static func entries(filter: ((Entry) -> Bool)?) -> [Entry]
    {
        let data = DataService.shared
        
        print ("Generating Team Lineups")
        let teamLineups = data.teamData.uniquePermutations(predicate: { $0.count == 3 })
        print ("... found \(teamLineups.count) combinations\n")
        
        print ("Generating Driver Lineups")
        let driverLineups = data.driverData.uniquePermutations(predicate: { $0.count == 3 })
        print ("... found \(driverLineups.count) combinations\n")
        
        print ("Generating Fantasy Entries")
        let entries = product(teams: teamLineups, drivers: driverLineups, filter: filter)
        print ("... Finished!\n\n")
        return entries
    }
    
    private static func product(teams: [[Team]], drivers: [[Driver]], filter: ((Entry) -> Bool)?) -> [Entry]
    {
        var output = [Entry]()
        for team in teams
        {
            for driver in drivers
            {
                let entry = Entry(drivers: driver, teams: team)
                
                if let filter = filter
                {
                    if (filter(entry)) { output.append(entry) }
                }
                else
                {
                    output.append(entry)
                }
            }
        }
        return output
    }
}
