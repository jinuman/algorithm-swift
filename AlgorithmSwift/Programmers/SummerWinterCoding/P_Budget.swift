// 예산
// 2018년

import Foundation

final class P_Budget {
    func solution(_ d: [Int], _ budget: Int) -> Int {
        let sortedNumbers = d.sorted(by: <)
        var answer = 0
        var amount = 0
        for number in sortedNumbers {
            if amount + number > budget {
                break
            }
            amount += number
            answer += 1
        }
        return answer
    }

    func run() {
        print(solution([1, 3, 2, 5, 4], 9)) // 3
        print(solution([2, 2, 3, 3], 10))  // 4
    }
}
