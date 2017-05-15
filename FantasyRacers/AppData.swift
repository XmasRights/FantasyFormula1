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
    init(commandLineArguments: [String])
    {
        arguments = commandLineArguments
    }

    func getDriverData() -> [Driver]
    {
        let contents = getJSONContents(atIndex: 1)
        do
        {
            return try JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.driverDataFormatter)
        }
        catch { /* TODO */ }

        return []
    }

    func getRaceData() -> [RaceResult]
    {
        let contents = getJSONContents(atIndex: 2)
        do
        {
            return try JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.raceResultFormatter)
        }
        catch { /* TODO */ }

        return []
    }

    func getTeamData() -> [Team]
    {
        let contents = getJSONContents(atIndex: 3)
        do
        {
            return try JSONDecoder.parse(jsonString: contents, withFormatter: Formatters.teamDataFormatter)
        }
        catch { /* TODO */ }

        return []
    }

    private func getJSONContents (atIndex index: Int) -> String
    {
        let arg = getFormattedArgument(atIndex: index)
        return getContents(ofFile: arg)
    }
    
    private func getContents (ofFile file: String) -> String
    {
        do
        {
            let contents = try String(contentsOfFile: file, encoding: String.Encoding.utf8)
            return contents
        }
        catch { print ("Could not read the data file") }
        return String();
    }

    private func getFormattedArgument(atIndex index: Int) -> String
    {
        let filenameWithTilde = CommandLine.arguments[index]
        let filename = NSString(string: filenameWithTilde).expandingTildeInPath

        return filename
    }

    private static func getContents(file: String) throws -> String
    {
        return try String(contentsOfFile: file, encoding: String.Encoding.utf8)
    }

    private let arguments: [String]
}
