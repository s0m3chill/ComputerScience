
import Foundation

public class BinarySearch {
    
    func binarySearch(sortedArray: [Int], target: Int) -> Int {
        var left = 0, right = sortedArray.count
        
        while (right - left > 1) {
            // https://ai.googleblog.com/2006/06/extra-extra-read-all-about-it-nearly.html
            let mid = left + (right - left) / 2
            
            if sortedArray[mid] > target {
                right = mid
            } else {
                left = mid
            }
        }
        
        return sortedArray[left] == target ? left : -1
    }
    
}

/// Usage:
///
///
let solution = BinarySearch()
let targetIndex = solution.binarySearch(sortedArray: [2,4,7,8,10,15], target: 4)
