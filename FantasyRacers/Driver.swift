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
    case Kvyat
}

struct Driver
{
    let name:     DriverName
    let price:    Int
    let team:     TeamName
    let teammate: DriverName
}

extension Driver
{
    init?(name: DriverName)
    {
        let data = DataService.shared
        guard let driver = data.driverData.filter({ $0.name == name }).first
            else { return nil }
        
        self.name     = driver.name
        self.price    = driver.price
        self.team     = driver.team
        self.teammate = driver.teammate
    }
}

extension Driver: Scoreable
{
    func score(for location: Location) -> Int
    {
        return Score.score(for: self, at: location) 
    }
}

extension Driver : CustomStringConvertible
{
    var description: String
    {
        return name.rawValue
    }
}
