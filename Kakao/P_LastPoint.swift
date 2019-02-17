// 나머지 한 점
// 직사각형의 세 점이 주어지고 나머지 한 점을 구하는 문제

import Foundation

class P_LastPoint {
    func solution(_ v: [[Int]]) -> [Int] {
        let xArr: [Int] = v.map {
            $0[0]
        }
        let yArr: [Int] = v.map {
            $0[1]
        }
        let x: Int = xArr.reduce(0, ^)
        let y: Int = yArr.reduce(0, ^)
        return [x, y]
    }

    func run() {
        print(solution([[1, 4], [3, 4], [3, 10]]))  // [1, 10]
        print(solution([[1, 1], [2, 2], [1, 2]]))   // [2, 1]
    }
}
