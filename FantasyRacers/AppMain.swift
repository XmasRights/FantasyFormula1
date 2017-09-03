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
            printAllEntries()
        }
        
        let seconds = time.converted(to: .seconds)
        print("That took \(seconds) seconds")
    }
    
    func printAllEntries()
    {
        let entries = Simulator.entries(filter: {$0.price == 75})
        
        for entry in entries.orderedByScore(at: .Belgium)
        {
            print(entry.descriptionWithScore(at: .Belgium))
        }
    }
}
