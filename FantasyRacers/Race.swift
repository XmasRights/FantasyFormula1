//
//  Race.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

enum Location: Int
{
    case australia, bahrain, china, russia, spain, monaco, canada, europe, austria
    case britain, hungary, germany, belgium, italy, singapore, malaysia, japan
    case usa, mexico, brazil, abuDhabi
}

struct Race
{
    let location: Location
    let points:   Int
    let value:    Double
}
