//
//  main.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

func doTheThing()
{
    do
    {
        let csv     = try FileGrabber.getFantasyRacersCSV()
        let drivers = try CSV.parse (csv)
        
        let data = Database(drivers: drivers)
        
        let top = data.getTopTeams(.Monaco, top: 10, teamSize: 3)
        
        for team in top
        {
            let points = Database.getTotalPoints(team, location: .Australia)
            print("\(team) = \(points)")
        }
    }
        
    catch FileGrabber.FileError.FileNotFound  { print("File Not Found")  }
    catch FileGrabber.FileError.FileReadError { print("File Read Error") }
    catch CSV.CSVError.DataParseError         { print("Data Read Error") }
    catch { print("Unknown Error") }
    
}

doTheThing();