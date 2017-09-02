//
//  AppMain.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 02/09/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

class AppMain
{
    func run()
    {
        let entries = Simulator.entries(filter: { $0.price < 75 && $0.price > 70 })
        let belgium = entries.orderedByScore(at: .Belgium)
        
        belgium.forEach { print($0.descriptionWithScore(at: .Belgium)) }
    }
}
