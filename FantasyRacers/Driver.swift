//
//  Driver.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

enum DriverName: String
{
    case Hamilton
    case Vettel
    case Bottas
    case Ricciardo
    case Verstappen
    case Raikkonen
    case Massa
    case Stroll
    case Ocon
    case Perez
    case Grosjean
    case Magnussen
    case Palmer
    case Hulkenberg
    case Alonso
    case Vandoorne
    case Ericsson
    case Wehrlein
    case Sainz
    case Kyvat
}

enum Team: String
{
    case Mercedes, RedBull, Ferrari, ForceIndia, Renault, McLaren
    case Williams, Sauber, TorroRosso, Haas
}

struct Driver
{
    let name:     DriverName
    let price:    Int
    let team:     Team
    let teammate: DriverName
}

extension Driver : CustomStringConvertible
{
    var description: String
    {
        return name.rawValue
    }
}

struct DriverResult
{
    let driver: DriverName
    let qualifyingPosition: Int
    let racePosition: Int
}
