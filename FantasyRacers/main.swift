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

let teams   = data.getTeamData()
let drivers = data.getDriverData()
let results = data.getRaceData()

//let australia = Scoring(race: .Russia,  allResults: results, allDrivers: drivers, allTeams: teams)
//let china     = Scoring(race: .China,   allResults: results, allDrivers: drivers, allTeams: teams)
//let bahrain   = Scoring(race: .Bahrain, allResults: results, allDrivers: drivers, allTeams: teams)
//let russia    = Scoring(race: .Russia,  allResults: results, allDrivers: drivers, allTeams: teams)
//let monaco    = Scoring(race: .Monaco,  allResults: results, allDrivers: drivers, allTeams: teams)
//let canada      = Scoring(race: .Canada,     allResults: results, allDrivers: drivers, allTeams: teams)
//let azerbaijan  = Scoring(race: .Azerbaijan, allResults: results, allDrivers: drivers, allTeams: teams)
let austria = Scoring(race: .Austria,     allResults: results, allDrivers: drivers, allTeams: teams)
let britain = Scoring(race: .Britain, allResults: results, allDrivers: drivers, allTeams: teams)
let hungary = Scoring(race: .Hungary,   allResults: results, allDrivers: drivers, allTeams: teams)
let belgium = Scoring(race: .Belgium, allResults: results, allDrivers: drivers, allTeams: teams)

let simulator = Simulator(drivers: drivers, teams: teams)
let entries   = simulator.getEntries(usingFilter: { $0.price <= 75 && $0.price >= 72 })

//Print.scores(forTeams: teams, usingScoring: belgium)
//Print.scores(forDrivers: drivers, usingScoring: [belgium])
Print.scores(forEntries: entries, usingRaceScores: [austria, britain, hungary, belgium])

