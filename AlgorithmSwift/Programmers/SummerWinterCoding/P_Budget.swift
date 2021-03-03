// 예산

/* 문제
 부서별로 신청한 금액이 들어있는 배열 d, 예산 budget
 최대로 지원할 수 있는 부서의 수 return

 For example,
 d: [4, 2, 3, 3], budget: 10 -> 4개의 부서에 지원하기엔 예산이 부족함 -> return 3
 */

import Foundation

struct P_Budget {
    func solution(_ d: [Int], _ budget: Int) -> Int {
        let sortedAmounts = d.sorted(by: <)
        var answer = 0
        var sum = 0
        for amount in sortedAmounts {
            if sum + amount > budget {
                break
            }
            sum += amount
            answer += 1
        }
        return answer
    }

    func run() {
        print(solution([1, 3, 2, 5, 4], 9)) // 3
        print(solution([2, 2, 3, 3], 10)) // 4
        print(solution([4, 2, 3, 3], 10)) // 3
    }
}
