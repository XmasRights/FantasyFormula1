//
//  FileGrabber.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

struct FileGrabber
{
    enum FileError: ErrorProtocol
    {
        case fileNotFound
        case fileReadError
    }
    
    static func getFantasyRacersCSV() throws -> String
    {
        let path = NSHomeDirectory() + "/Desktop/Fantasy Racers.csv"
        
        do
        {
            let contents = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return contents
        }
        catch _ as NSError
        {
            throw FileError.fileReadError
        }
    }
}
