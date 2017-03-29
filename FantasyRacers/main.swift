//
//  main.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

func getFileFromCommandLine() -> String
{
    assert(CommandLine.arguments.count >= 2, "Incorrect number of command line arguments")

    let filenameWithTilde = CommandLine.arguments[1]
    let filename = NSString(string: filenameWithTilde).expandingTildeInPath

    return filename
}

do
{
    let file     = getFileFromCommandLine()
    let contents = try File.getContents(file: file)
    print(contents)
}
catch { print ("Could not read the data file") }



