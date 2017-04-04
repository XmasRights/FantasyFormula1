//
//  main.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation


assert(CommandLine.arguments.count >= 4, "Incorrect number of command line arguments")


let data = AppData(commandLineArguments: CommandLine.arguments)

let teams   = data.getTeamData();
let drivers = data.getDriverData()
let results = data.getRaceData()

let scores = Scoring(race: .Australia, allResults: results, allDrivers: drivers, allTeams: teams)

let simulator = Simulator(drivers: drivers, teams: teams)
let entries   = simulator.getEntries(usingFilter: { $0.price <= 75 && $0.getScore(scoreing: scores) > 100 })


Print.scores(forDriver: drivers, usingScoring: scores)
print("")
Print.scores(forTeams: teams, usingScoring: scores)
print("")
Print.scores(forEntries: entries, usingScoring: scores)
