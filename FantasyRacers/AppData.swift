//
//  AppData.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 11/06/2016.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

enum AppDataError : Error
{
    case DriverDataError
    case RaceDataError
    case TeamDataError
}

struct AppData
{
    static func getDriverData() throws -> [Driver]
    {
        guard let contents = driverJSON() else { throw AppDataError.DriverDataError }
        do { return try JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.driverDataFormatter) }
        catch { throw error }
    }
    
    static func getRaceData() throws -> [RaceResult]
    {
        guard let contents = resultsJSON() else { throw AppDataError.RaceDataError }
        do { return try JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.raceResultFormatter) }
        catch { throw error }
    }
    
    static func getTeamData() throws -> [Team]
    {
        guard let contents = teamJSON() else { throw AppDataError.TeamDataError }
        do { return try JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.teamDataFormatter) }
        catch { throw error }
    }
    
    static private func dataDirectory() -> URL?
    {
        // Modify this to specify wherever you keep your JSON
        
        if #available(OSX 10.12, *)
        {
            let home = FileManager.default.homeDirectoryForCurrentUser
            
            return home.appendingPathComponent("Code")
                .appendingPathComponent("FantasyFormula1")
                .appendingPathComponent("Data")
        } else {
            print ("Please run this on macOS 10.12 or later")
        }
        
        return nil
    }
    
    static private func driverJSON()  -> String? { return json(withFilename: "Drivers")  }
    static private func resultsJSON() -> String? { return json(withFilename: "Results") }
    static private func teamJSON()    -> String? { return json(withFilename: "Teams")   }
    
    static private func json(withFilename name: String) -> String?
    {
        guard let data = dataDirectory() else { return nil }
        let file = data.appendingPathComponent(name + ".json")
        return try? String(contentsOf: file)
    }
}
