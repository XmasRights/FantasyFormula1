//
//  JSON.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 29/03/2017.
//  Copyright © 2017 Christoher Fonseka. All rights reserved.
//

import Foundation

enum JSONDecoderError : Error
{
    case InvalidJSONObject
    case MissingKey(String)
}

struct JSONDecoder
{
    static func parse<T>(jsonString: String, withFormatter formatter: (AnyObject) throws -> [T]) throws -> [T]
    {
        let data = jsonString.data(using: String.Encoding.utf8)

        do
        {
            let json   = try JSONSerialization.jsonObject(with: data!) as AnyObject
            let output = try formatter (json)
            return output
        }
        catch { throw error }
    }
}

enum FormatterError : Error
{
    case MissingKey(String, String)
}

struct Formatters
{
    static func driverDataFormatter (jsonArray: AnyObject) throws -> [Driver]
    {
        var output = [Driver]()

        for entry in jsonArray as! [AnyObject]
        {
            guard let driverJson = entry["driver"] as AnyObject? else { continue }

            guard let nameStr     = driverJson["name"]     as? String else { throw FormatterError.MissingKey ("Driver", "Name") }
            guard let priceStr    = driverJson["price"]    as? String,
                  let teamStr     = driverJson["team"]     as? String,
                  let teammateStr = driverJson["teammate"] as? String else { continue }

            guard let name     = DriverName(rawValue: nameStr),
                  let price    = Int(priceStr),
                  let team     = TeamName(rawValue: teamStr),
                  let teammate = DriverName(rawValue: teammateStr) else { continue }

            let driver = Driver(name: name,
                                price: price,
                                team: team,
                                teammate: teammate)

            output.append(driver)
        }
        return output
    }

    static func teamDataFormatter (jsonArray: AnyObject) throws -> [Team]
    {
        var output = [Team]()

        for entry in jsonArray as! [AnyObject]
        {
            guard let teamnameStr = entry["Team"]  as? String,
                  let price       = entry["Price"] as? Int     else { continue }

            guard let teamname = TeamName(rawValue: teamnameStr) else { continue }

            let team = Team(name: teamname, price: price)
            output.append(team)
        }
        return output
    }

    static func raceResultFormatter (jsonArray: AnyObject) throws -> [RaceResult]
    {
        var output = [RaceResult]()

        for entry in jsonArray as! [AnyObject]
        {
            guard let locationStr = entry["location"] as? String,
                  let results     = entry["results"]  as? [AnyObject]  else { continue }

            for result in results
            {
                guard let driverStr = result ["driver"]     as? String,
                      let qualiStr  = result ["qualifying"] as? String,
                      let raceStr   = result ["race"]       as? String else { continue }

                guard let driver   = DriverName(rawValue: driverStr),
                      let location = Location(rawValue: locationStr),
                      let qualiUNF = Int (qualiStr),
                      let raceUNF  = Int (raceStr)                     else { continue }

                let quali    = Position(value: qualiUNF);
                let race     = Position(value: raceUNF);

                let raceResult = RaceResult(driver: driver, location:location, qulifyingPosition: quali, racePosition: race)
                output.append(raceResult)
            }
        }
        return output
    }
}

