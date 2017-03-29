//
//  CSVParser.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

struct CSV
{
    enum CSVError: Error
    {
        case dataParseError
    }
    
    static func parse(_ fileContents: String) throws -> [Driver]
    {
        let lines = fileContents.components(separatedBy: "\n")
        let count = lines.count
        var drivers = [Driver]()
        
        for index in 1..<count
        {
            let line   = lines[index]
            
            do
            {
                let driver = try getDriver (line)
                drivers.append(driver)
            }
            catch
            {
                throw CSVError.dataParseError
            }
        }
        
        return drivers
    }
    
    private static func getDriver(_ fileContents: String) throws -> Driver
    {
        let data      = fileContents.components(separatedBy: ",")
        var raceIndex = 0
        let name      = data[0]
        var races     = [Race]()
        
        for index in stride(from: 1, to: data.count, by: 2)
        {
            let points = Int(data[index])      ?? 0
            let value  = Double(data[index+1]) ?? 99
            
            guard let location = Location(rawValue: raceIndex) else { print("LOCATION");throw CSVError.dataParseError }
            raceIndex = raceIndex + 1
  
            let race = Race (location:location, points:points, value:value)
            races.append(race)
        }
        
        return Driver (name:name, races:races)
    }
}
