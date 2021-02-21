// 예산
// 2018 - Summer Coding

import Foundation

final class P_Budget {
    func solution(_ d: [Int], _ budget: Int) -> Int {
        let sortedNumbers = d.sorted(by: <)
        var count = 0
        var amount = 0
        for number in sortedNumbers {
            if amount + number > budget {
                break
            }
            amount += number
            count += 1
        }
        return count
    }

    func run() {
        print(solution([1, 3, 2, 5, 4], 9)) // 3
        print(solution([2, 2, 3, 3], 10))  // 4
    }
}
