//
//  Race.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

enum Location
{
    case Australia, Bahrain, China, Russia, Spain, Monaco, Canada, Europe, Austria
    case Britain, Hungary, Germany, Belgium, Italy, Singapore, Malaysia, Japan
    case USA, Mexico, Brazil, AbuDhabi
}

struct Race
{
    let location: Location
    let Points:   Int
    let Value:    Int
}
