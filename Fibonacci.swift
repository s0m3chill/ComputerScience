
public class Solution {
    
    private var memo: [Int: Int] = [:]
        
    func fibonacci(_ n: Int) -> Int {
        if n == 1 { return 1 }
        if n == 2 { return 2 }
        if memo.keys.contains(n) {
            return memo[n] ?? 0
        }
        var res = 0
        res = fibonacci(n-2) + fibonacci(n-1)
        memo[n] = res
        return res
    }
    
}

/// Usage:
///
///
let solution = Solution()
let result = solution.fibonacci(5)
