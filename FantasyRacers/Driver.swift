//
//  Driver.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

func ==(lhs: Driver, rhs: Driver) -> Bool
{
    return lhs.name == rhs.name
}

struct Driver: Hashable
{
    let name:  String
    let races: [Race]
    
    var hashValue: Int
    {
        return self.name.hashValue
    }
}