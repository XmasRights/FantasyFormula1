//
//  main.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation


assert(CommandLine.arguments.count >= 3, "Incorrect number of command line arguments")

let data = AppData(commandLineArguments: CommandLine.arguments)

let driverJSON = data.getDriverData()
let drivers    = JSONDecoder.parse(jsonString: driverJSON, withFormatter: Formatters.driverDataFormatter)

//let raceJSON = data.getRaceData()
//let races    = JSONDecoder.parse(jsonString: raceJSON, withFormatter: Formatters.raceResultFormatter)

let driverLineups = drivers.uniquePermutations(withMaxLength: 3).filter { return $0.count == 3 }

print ("Unique Permutations")
print (driverLineups)

