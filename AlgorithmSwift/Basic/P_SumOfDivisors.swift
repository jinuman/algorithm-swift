// 약수의 합
// for 문을 n/2만 돌리는 방법

import Foundation

final class P_SumOfDivisors {
    func solution(_ n: Int) -> Int {
        var sum: Int = 0
        for i in stride(from: 1, through: n / 2, by: 1) {
            if n % i == 0 {
                sum += i
            }
        }
        return sum + n
    }

    func run() {
        print(solution(12)) // 28
        print(solution(5))  // 6
    }
}
