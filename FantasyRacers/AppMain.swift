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
            let locations: [Location] = [.Belgium, .Italy, .Singapore, .Malaysia, .Japan]

            for driver in Driver.all().sorted(by: { (a, b) in a.score(for: locations) > b.score(for: locations) })
            {
                print(driver.descriptionWithScores(at: locations))
            }
            
            let entries = Simulator.entries(filter: { $0.price < 76 && $0.price > 70 })
                                   .filter { $0.score(for: locations) > 500 }

            for entry in entries.orderedByScores(at: locations)
            {
                print(entry.descriptionWithScores(at: locations))
            }
        }
        
        let seconds = time.converted(to: .seconds)
        print("That took \(seconds) seconds")
    }
}
