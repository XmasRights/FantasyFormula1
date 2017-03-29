//
//  File.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 11/06/2016.
//  Copyright © 2017 Christopher Fonseka. All rights reserved.
//

import Foundation

struct File
{
    static func getContents(file: String) throws -> String
    {
        return try String(contentsOfFile: file, encoding: String.Encoding.utf8)
    }
}
