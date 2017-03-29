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
    case Austra, Britain, Hungary, Belgium, Italy, Singapore, Malaysia, Japan
    case USA, Mexico, Brazil, AbuDhabi
}

struct Race
{
    let location: Location
    let result:   [Classification]
}
