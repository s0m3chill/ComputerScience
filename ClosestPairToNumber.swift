//
//  ClosestPairToNumber.swift
//  
//
//  Created by Dariy Kordiyak on 11.09.2022.
//

import Foundation

public class ClosestPairToNumber {
    
    func closestPairOfNumbersToTarget(_ pairs: [[Int]], _ target: Int) -> [Int] {
        var res = [0,0]
        var flat = pairs.flatMap { $0 }
        
        // dynamic approach
        var smallestDiff = 100000000
        var smallestDiffIndex = -1
        for (i, num) in flat.enumerated() {
            let diff = abs(target - num)
            if diff < smallestDiff {
                smallestDiff = diff
                smallestDiffIndex = i
            }
        }
        
        let pairIndex = smallestDiffIndex / 2
        res = pairs[pairIndex]
        
        return res
    }
    
}

/// Usage:
///
///
let solution = ClosestPairToNumber()
let closestPair = solution.closestPairOfNumbersToTarget([[0,5], [10,12], [15,19]], 8)

print(closestPair)
