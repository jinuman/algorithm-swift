// 두 정수 사이의 합

// 등차수열의 합 공식 이용!

import Foundation

final class P_SumBetweenTwoNumbers {
    func solution(_ a: Int, _ b: Int) -> Int64 {
        let minNumber: Int = min(a, b)
        let maxNumber: Int = max(a, b)
        return Int64((maxNumber - minNumber + 1) * (minNumber + maxNumber) / 2)
    }

    func run() {
        print(self.solution(3, 5))  // 12
        print(self.solution(3, 2))  // 5
        print(self.solution(5, 3))  // 12
    }
}
