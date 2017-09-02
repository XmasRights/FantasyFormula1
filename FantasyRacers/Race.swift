//
//  Race.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

enum Location: String
{
    case Australia, China, Bahrain, Russia, Spain, Monaco, Canada, Azerbaijan
    case Austria, Britain, Hungary, Belgium, Italy, Singapore, Malaysia, Japan
    case USA, Mexico, Brazil, AbuDhabi
}

enum Position
{
    case Finished(position: Int)
    case DNF

    init(value: Int)
    {
        if value <= 0 { self = .DNF }
        else          { self = .Finished(position: value) }
    }
}

struct RaceResult
{
    let driver: DriverName
    let location: Location
    let qualifyingPosition: Position
    let racePosition: Position
}

extension RaceResult
{
    init?(driver: DriverName, location: Location)
    {
        let data = DataService.shared
        guard let race = data.raceData.filter({ $0.location == location && $0.driver == driver }).first
            else { return nil }
        
        self.driver             = race.driver
        self.location           = race.location
        self.qualifyingPosition = race.qualifyingPosition
        self.racePosition       = race.racePosition
    }
}
