//
//  Team.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 04/04/2017.
//  Copyright © 2017 Christoher Fonseka. All rights reserved.
//

import Foundation

enum TeamName: String
{
    case Mercedes, RedBull, Ferrari, ForceIndia, Renault, McLaren
    case Williams, Sauber, ToroRosso, Haas
}

struct Team
{
    let name:  TeamName
    let price: Int
}

extension Team
{
    init?(name: TeamName)
    {
        let data = DataService.shared
        guard let team = data.teamData.filter({ $0.name == name }).first
            else { return nil }
        
        self.name  = team.name
        self.price = team.price
    }
}

extension Team: CustomStringConvertible
{
    var description: String
    {
        return name.rawValue
    }
}
