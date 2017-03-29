//
//  JSON.swift
//  FantasyRacers
//
//  Created by Christopher Fonseka on 29/03/2017.
//  Copyright © 2017 Christoher Fonseka. All rights reserved.
//

import Foundation

struct JSONDecoder
{
    static func parseForDriverData(jsonString: String) -> [Driver]
    {
        let data = jsonString.data(using: String.Encoding.utf8)

        if let json = try? JSONSerialization.jsonObject(with: data!) as AnyObject
        {
            return driverArray(jsonArray: json)
        }
        print ("Could not decode JSON")
        return []
    }

    private static func driverArray (jsonArray: AnyObject) -> [Driver]
    {
        var output = [Driver]()

        for entry in jsonArray as! [AnyObject]
        {
            guard let driverJson = entry["driver"] as AnyObject? else { continue }

            guard let name     = driverJson["name"]     as? String,
                  let priceStr = driverJson["price"]    as? String,
                  let teamStr  = driverJson["team"]     as? String,
                  let teammate = driverJson["teammate"] as? String else { continue }

            guard let price = Int(priceStr),
                  let team  = Team(rawValue: teamStr) else { continue }


            let driver = Driver(name: name,
                                price: price,
                                team: team,
                                teammate: teammate)

            output.append(driver)
        }
        return output
    }
}
