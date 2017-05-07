//
//  main.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation


assert(CommandLine.arguments.count >= 4, "Incorrect number of command line arguments")

//
//let path = FileManager.default.currentDirectoryPath
//print (path)
//
//if let contents = try? FileManager.default.contentsOfDirectory(atPath: path)
//{
//    print (contents)
//}
//else
//{
//    print("Could not load contnetns")
//}
//
let data = AppData()

do
{
    let teams   = try AppData.getTeamData()
    let drivers = try AppData.getDriverData()
    let results = try AppData.getRaceData()
    
} catch { print (error) }

    //let australia = Scoring(race: .Russia,  allResults: results, allDrivers: drivers, allTeams: teams)
    //let china     = Scoring(race: .China,   allResults: results, allDrivers: drivers, allTeams: teams)
    //let bahrain   = Scoring(race: .Bahrain, allResults: results, allDrivers: drivers, allTeams: teams)
    //let russia    = Scoring(race: .Russia,  allResults: results, allDrivers: drivers, allTeams: teams)
    //
    //
    //let simulator = Simulator(drivers: drivers, teams: teams)
    //let entries   = simulator.getEntries(usingFilter: { $0.price <= 75 && $0.price >= 72 })
    
    //Print.scores(forEntries: entries, usingRaceScores: [australia, china, bahrain, russia])
    //Print.scores(forDrivers: drivers, usingScoring: [australia, china, bahrain, russia])
