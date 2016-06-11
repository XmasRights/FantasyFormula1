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
    enum FileError: ErrorType
    {
        case FileNotFound
        case FileReadError
    }
    
    static func getFantasyRacersCSV() throws -> String
    {
        let path = NSHomeDirectory().stringByAppendingString("/Desktop/Fantasy Racers.csv")
        
        do
        {
            let contents = try String(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            return contents
        }
        catch _ as NSError
        {
            throw FileError.FileReadError
        }
    }
}