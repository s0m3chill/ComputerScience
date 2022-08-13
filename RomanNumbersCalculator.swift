//
//  RomanNumbersCalculator.swift
//  
//
//  Created by Dariy Kordiyak on 13.08.2022.
//

import Foundation

public class RomanNumbersCalculator {
    
    // MARK: - Properties
    
    private let values =  [1000, 900, 500, 400,  100,  90,  50,   40,  10,   9,    5,   4,   1]
    private let symbols = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"]
    
    // MARK: - API
    
    public func intToRoman(_ num: Int) -> String {
        var numCop = num
        var res = ""
        
        while numCop != 0 {
            for (i, n) in values.enumerated() where numCop - n >= 0 {
                numCop -= n
                res += symbols[i]
                break
            }
        }
        
        return res
    }
    
    public func romanToInt(_ s: String) -> Int {
        var res = 0
        var prev = 0
        let chars: [String] = s.map { String($0) }
        
        for c in chars.reversed() {
            guard let indexInCharArray = symbols.firstIndex(of: c) else { return -1 }
            let val = values[indexInCharArray]
            res += (val >= prev ? 1 : -1) * val
            prev = val
        }
        
        return res
    }
    
}

/// Usage:
///
///
let calc = RomanNumbersCalculator()

let romanInput = "IV"
let integerFromRoman = calc.romanToInt(romanInput)

let intInput = 332
let romanFromInteger = calc.intToRoman(intInput)
