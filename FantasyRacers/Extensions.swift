//
//  Extensions.swift
//  FantasyRacers
//
//  Created by Chris Home on 11/06/2016.
//  Copyright © 2016 Christoher Fonseka. All rights reserved.
//

import Foundation

extension Array
{
    private func uniquePermutations (_ listA: [Element], listB: [Element], output: inout [[Element]], maxSize: Int)
    {
        if (maxSize > 0 && listA.count > maxSize)
        {
            return
        }
        
        output.append(listA)
        
        if (!listB.isEmpty)
        {
            for (index, element) in listB.enumerated()
            {
                var newA = listA; newA.append(element)
                var newB = listB; newB.removeSubrange(0...index)
                
                uniquePermutations(newA, listB: newB, output: &output, maxSize: maxSize)
            }
        }
    }
    
    func uniquePermutations(_ withMaxSize: Int = 0) -> [[Element]]
    {
        var output = [[Element]]()
        uniquePermutations([], listB: self, output: &output, maxSize: withMaxSize)
        return output
    }
}
