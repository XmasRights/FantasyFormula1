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
    let qulifyingPosition: Position
    let racePosition: Position
}

