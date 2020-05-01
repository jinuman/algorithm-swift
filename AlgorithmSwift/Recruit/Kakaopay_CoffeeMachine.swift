// 2019년 카카오페이 인턴 3번문제

import Foundation

class Kakaopay_CoffeeMachine {

    func solution(_ N: Int, _ coffee_times: [Int]) -> [Int] {
        var d: [Int : Int] = [ : ]
        for (idx, time) in coffee_times.enumerated() {
            d[idx + 1] = time
        }
        var result = [Int]()
        while true {
            if result.count == d.count {
                break
            }
            if d.count < N {
                for i in 1...d.count {
                    d[i]! -= 1
                    if d[i] == 0 {
                        result.append(i)
                    }
                }
            } else {
                var cnt: Int = 0
                for i in 1...d.count {
                    if d[i] != -1 {
                        d[i]! -= 1
                        cnt += 1
                    }
                    if d[i] == 0 {
                        result.append(i)
                        d[i] = -1
                    }
                    if cnt == N {
                        break
                    }
                }
            }
        }
        return result
    }

    func run() {
        print(solution(3, [4, 2, 2, 5, 3]))     // [2, 3, 1, 5, 4]
        print(solution(1, [100, 1, 50, 1, 1]))  // [1, 2, 3, 4, 5]
    }
}