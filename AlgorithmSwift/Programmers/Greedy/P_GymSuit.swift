// 체육복

import Foundation

class P_GymSuit {
    func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
        let newReserve = reserve.filter { !lost.contains($0) } // 더이상 여벌이 아닌 학생을 거른다.
        let newLost = lost.filter { !reserve.contains($0) }    // 잃어버렸지만 수업에 참가할 수 있는 학생을 거른다.
        var lostPeople: Int = newLost.count
        
        newReserve.forEach {
            let isLend: Bool = newLost.contains($0 - 1) || newLost.contains($0 + 1)
            if isLend && lostPeople > 0 {
                lostPeople -= 1
            }
        }
        
        return n - lostPeople
    }
    
    func run() {
        print(solution(5, [2, 4], [1, 3, 5])) // 5
        print(solution(5, [2, 4], [3]))       // 4
        print(solution(3, [3], [1]))          // 2
        print(solution(3, [1, 2], [2, 3]))    // 2
    }
}
