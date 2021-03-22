// 나머지 한 점

/* 문제
 직사각형의 세 점이 주어질 때 나머지 한 점의 좌표를 return
 */

import Foundation

final class P_LastPoint {
    func solution(_ v: [[Int]]) -> [Int] {
        let xList: [Int] = v.map { $0[0] } // [1, 3, 3]
        let yList: [Int] = v.map { $0[1] } // [4, 4, 10]

        let x: Int = xList.reduce(0, ^)
        let y: Int = yList.reduce(0, ^)
        return [x, y]
    }

    func run() {
        print(solution([[1, 4], [3, 4], [3, 10]]))  // [1, 10]
        print(solution([[1, 1], [2, 2], [1, 2]]))   // [2, 1]
    }
}
