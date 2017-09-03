//
//  Scoreable.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 02/09/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

protocol Scoreable
{
    func score(for location: Location) -> Int
}

extension Scoreable
{
    func score(for locations: [Location]) -> Int
    {
        return locations.reduce(0) { $0 + self.score(for: $1) }
    }
    
    func descriptionWithScore(at location: Location) -> String
    {
        return "\(self.score(for: location)) - \(self)"
    }
    
    func descriptionWithScores(at locations: [Location]) -> String
    {
        return "\(self.score(for: locations)) - \(self)"
    }
}

extension Array where Element: Scoreable
{
    func orderedByScore(at location: Location) -> [Scoreable]
    {
        return self.sorted(by: { $0.score(for: location) > $1.score(for: location) })
    }
    
    func orderedByScores(at locations: [Location]) -> [Scoreable]
    {
        return self.sorted(by: { $0.score(for: locations) > $1.score(for: locations) })
    }
}
