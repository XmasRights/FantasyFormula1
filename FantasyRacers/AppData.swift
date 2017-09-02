//
//  AppData.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 11/06/2016.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

struct AppData
{
    static func driverData() -> [Driver]?
    {
        guard let contents = jsonStringFor(file: .Drivers) else { return nil }
        return JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.driverDataFormatter)
    }
    
    static func raceData() -> [RaceResult]?
    {
        guard let contents = jsonStringFor(file: .Results) else { return nil }
        return JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.raceResultFormatter)
    }
    
    static func teamData() -> [Team]?
    {
        guard let contents = jsonStringFor(file: .Teams) else { return nil }
        return JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.teamDataFormatter)
    }
    
    private enum DataFile: String
    {
        case Drivers, Results, Teams
    }
    
    private static func jsonStringFor(file: DataFile) -> String?
    {
        guard let filePath = Bundle.main.path(forResource: file.rawValue, ofType: "json")
            else { return nil }
        
        guard let contents = try? String(contentsOfFile: filePath, encoding: .utf8)
            else { return nil }
        
        return contents
    }
}
