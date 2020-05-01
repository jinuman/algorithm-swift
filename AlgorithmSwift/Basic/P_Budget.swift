// 예산
// 2018 서머코딩

import Foundation

class P_Budget {
    func solution(_ d: [Int], _ budget: Int) -> Int {
        let sortedArr = d.sorted()
        var cnt = 0
        var need = 0
        for item in sortedArr {
            if need + item > budget {
                break
            }
            need += item
            cnt += 1
        }
        return cnt
    }

    func run() {
        print(solution([1, 3, 2, 5, 4], 9)) // 3
        print(solution([2, 2, 3, 3], 10))  // 4
    }
}