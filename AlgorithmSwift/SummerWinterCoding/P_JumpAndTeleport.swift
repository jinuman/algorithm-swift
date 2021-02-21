// 점프와 순간이동
// 2018년

import Foundation

final class P_JumpAndTeleport {
    /// Dynamic Programming version
    private func memoization(_ n: Int) -> Int {
        var memo: [Int] = Array(repeating: 0, count: n + 1)
        memo[1] = 1

        for i in stride(from: 2, through: n, by: 1) {
            if i % 2 == 0 {
                memo[i] = memo[i / 2]
            } else {
                memo[i] = memo[(i - 1) / 2] + 1
            }
        }
        return memo[n]
    }

    func solution(_ n: Int) -> Int {
        var n = n
        var answer = 1
        while n != 1 {
            if n % 2 == 0 {
                n /= 2
            } else {
                n -= 1
                answer += 1
            }
        }
        return answer
    }

    func run() {
        print(solution(5)) // 2
        print(solution(6)) // 2
        print(solution(5000)) // 5
        print(solution(1)) // 1
    }
}
