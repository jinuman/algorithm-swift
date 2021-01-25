// 예산
// 2018 서머코딩

import Foundation

final class P_Budget {
    func solution(_ d: [Int], _ budget: Int) -> Int {
        let sortedNumbers = d.sorted()
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
        print(self.solution([1, 3, 2, 5, 4], 9)) // 3
        print(self.solution([2, 2, 3, 3], 10))  // 4
    }
}
