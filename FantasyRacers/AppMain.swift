//
//  AppMain.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 02/09/2017.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

func executionTime(function: ()->()) -> Measurement<UnitDuration>
{
    let start = DispatchTime.now()
    function()
    let end = DispatchTime.now()
    
    let nanoseconds = end.uptimeNanoseconds - start.uptimeNanoseconds
    let seconds     = Double(nanoseconds) / 1_000_000_000
    
    return Measurement(value: seconds, unit: UnitDuration.seconds)
}

class AppMain
{
    func run()
    {
        let time = executionTime
        {
            let locations: [Location] = [.Austria, .Britain, .Hungary, .Belgium]
            
            let entries = Simulator.entries(filter: { $0.price < 76 && $0.price > 70 })
            
            for entry in entries.orderedByScores(at: locations)
            {
                print(entry.descriptionWithScores(at: locations))
            }
        }
        
        let seconds = time.converted(to: .seconds)
        print("That took \(seconds) seconds")
    }
}
