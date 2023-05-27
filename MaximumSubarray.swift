
public class Solution {
    
    func maxSubArray(_ nums: [Int]) -> Int {
        // Kadane's algorithm

        var maxSum = -10000000000000000
        var curSum = 0
        for i in nums {
            if curSum < 0 {
                curSum = 0
            }
            curSum += i
            maxSum = max(curSum, maxSum)
        }
        return maxSum
    }
    
}

/// Usage:
///
///
let solution = Solution()
let result = solution.maxSubArray([2,3,6,-5,2,-1])
