
import Foundation

public class BinarySearch {
    
    func search(_ nums: [Int], _ target: Int) -> Int {
        var sortedArray = nums
        var left = 0
        var right = sortedArray.count - 1
        
        while left <= right {
// https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html
            let middle = left + ((right - left) / 2)
            if sortedArray[middle] == target {
                return middle
            }
            if sortedArray[middle] < target {
                left = middle + 1
            } else {
                right = middle - 1
            }
        }
        
        return -1
    }
    
}

/// Usage:
///
///
let solution = BinarySearch()
let targetIndex = solution.search([2,4,7,8,10,15], 4)
