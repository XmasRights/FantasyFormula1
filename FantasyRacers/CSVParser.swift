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
    enum CSVError: ErrorType
    {
        case DataParseError
    }
    
    static func parse(fileContents: String) throws -> [Driver]
    {
        let lines = fileContents.componentsSeparatedByString("\n")
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
                throw CSVError.DataParseError
            }
        }
        
        return drivers
    }
    
    private static func getDriver(fileContents: String) throws -> Driver
    {
        let data  = fileContents.componentsSeparatedByString(",")
        
        let count     = data.count
        var raceIndex = 0
        
        let name = data[0]
        var races = [Race]()
        
        for var index in 1..<count
        {
            guard let points = Int(data[index++])                else { throw CSVError.DataParseError }
            guard let value  = Double(data[index++])             else { throw CSVError.DataParseError }
            guard let location = Location(rawValue: raceIndex++) else { throw CSVError.DataParseError }
            
            
            let race = Race (location:location, points:points, value:value)
            races.append(race)
        }
        
        return Driver (name:name, races:races)
    }
}