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

    func getDriverData() -> String
    {
        let arg = getFormattedArgument(atIndex: 1)
        return getContents(ofFile: arg)
    }

    func getRaceData() -> String
    {
        let arg = getFormattedArgument(atIndex: 2)
        return getContents(ofFile: arg)
    }

    func getTeamData() -> String
    {
        let arg = getFormattedArgument(atIndex: 3)
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
