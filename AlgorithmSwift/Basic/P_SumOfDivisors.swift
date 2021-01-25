// 약수의 합

// 루프를 반만 돌려서 처리!

import Foundation

final class P_SumOfDivisors {
    func solution(_ n: Int) -> Int {
        var sum: Int = 0
        for i in stride(from: 1, through: n / 2, by: 1) {
            if n % i == 0 {
                sum += i
            }
        }
        return n + sum
    }

    func run() {
        print(self.solution(12)) // 28
        print(self.solution(5))  // 6
    }
}
