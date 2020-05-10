// 피보나치 수 4
// 0 <= n && n <= 10000
// 런타임 에러 ..

import Foundation

class B_10826 {
    
    func run() {
        guard let n = Int(readLine() ?? "") else { return }
        var dp = [Int64].init(repeating: 0, count: max(n + 1, 2))
        dp[1] = 1
        for i in 2 ... n {
            dp[i] = dp[i - 1] + dp[i - 2]
        }
        print(dp[n])
    }
    
}

/*
input
10

output
55
*/
