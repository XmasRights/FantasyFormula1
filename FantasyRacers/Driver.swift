//
//  Driver.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

enum Team: String
{
    case Mercedes, RedBull, Ferrari, ForceIndia, Renault, McLaren
    case Williams, Sauber, TorroRosso, Haas
}

struct Driver
{
    let name:     String
    let price:    Int
    let team:     Team
    let teammate: String
}

struct RaceResult
{
    let qualifyingPosition: Int
    let racePosition: Int
}

struct Classification
{
    let driver: Driver
    let result: RaceResult
}
