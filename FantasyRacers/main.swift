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

let teamJSON = data.getTeamData();
let teams    = JSONDecoder.parse(jsonString: teamJSON, withFormatter: Formatters.teamDataFormatter)

print (teams);


/*
let driverJSON = data.getDriverData()
let drivers    = JSONDecoder.parse(jsonString: driverJSON, withFormatter: Formatters.driverDataFormatter)

let raceJSON = data.getRaceData()
let races    = JSONDecoder.parse(jsonString: raceJSON, withFormatter: Formatters.raceResultFormatter)
*/

/*
print ("Unique Permutations")
let driverLineups = drivers.uniquePermutations(withPredicate: { $0.count == 3 })
for lineup in driverLineups
{
    let value = lineup.reduce(0, { $0 + $1.price })
    print ("\(lineup) -> \(value)")
}
*/

/*
var orderedList = [(Int, Driver)]()
for driver in drivers
{
    let points = Scoring.points(forDriver: driver, atRace: .Australia, usingResults: races)
    orderedList.append((points, driver))
}

for item in orderedList.sorted(by: {$0.0 > $1.0})
{
    print ("\(item.0) -> \(item.1.name.rawValue) (\(Float(item.0) / Float(item.1.price)) points per million)")
}
*/

