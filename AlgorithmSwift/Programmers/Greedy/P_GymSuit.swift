// 체육복

/* 문제
 점심시간에 도둑이 들어, 일부 학생이 체육복을 도난당했습니다. 다행히 여벌 체육복이 있는 학생이 이들에게 체육복을 빌려주려 합니다.
 학생들의 번호는 체격 순으로 매겨져 있어, 바로 앞번호의 학생이나 바로 뒷번호의 학생에게만 체육복을 빌려줄 수 있습니다.
 전체 학생의 수 n, 체육복을 도난당한 학생들의 번호가 담긴 배열 lost, 여벌의 체육복을 가져온 학생들의 번호가 담긴 배열 reserve
 체육 수업을 들을 수 있는 학생의 최대값 return

 제한 사항
 - 전체 학생 수는 2명 이상 30명 이하
 - 체육복을 도난당한 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없음
 - 여벌의 체육복을 가져온 학생의 수는 1명 이상 n명 이하이고 중복되는 번호는 없음
 - 여벌 체육복이 있는 학생만 다른 학생에게 체육복을 빌려줄 수 있음
 - 여벌 체육복을 가져온 학생이 도난당했을 수도 있다. 이때 이 학생은 체육복을 하나만 도난당했다고 가정하며, 남은 체육복이 하나이기에 다른학생에게는 체육복을 빌려줄 수 없다.

 For example,
 n: 5, lost: [2, 4], reserve: [3] -> 3이 2나 4를 빌려줄 수 있기 때문에 5 - 2 + 1 = 4 return
 n: 3, lost: [3], reserve: [1] -> 1은 3을 빌려줄 수 없으므로 3 - 1 = 2 return
 */

import Foundation

struct P_GymSuit {
    func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
        let newReserve = reserve.filter { !lost.contains($0) } // 더이상 여벌이 아닌 학생을 거른다.
        let newLost = lost.filter { !reserve.contains($0) }    // 잃어버렸지만 수업에 참가할 수 있는 학생을 거른다.
        var lostPeople: Int = newLost.count

        for angel in newReserve {
            let canAngel: Bool = newLost.contains(angel - 1) || newLost.contains(angel + 1)
            if canAngel, lostPeople > 0 {
                lostPeople -= 1
            }
        }
        return n - lostPeople
    }
    
    func run() {
        print(solution(5, [2, 4], [1, 3, 5])) // 5
        print(solution(5, [2, 4], [3])) // 4
        print(solution(3, [3], [1])) // 2
        print(solution(3, [1, 2], [2, 3])) // 2
    }
}
