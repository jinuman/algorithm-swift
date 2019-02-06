// x만큼 간격이 있는 n개의 숫자

import Foundation

class P_SpacedByX {
    func solution(_ x: Int, _ n: Int) -> [Int64] {
        var arr = [Int64].init(repeating: 0, count: n)
        for i in 0..<n {
            arr[i] = Int64(x * (i + 1))
        }
        return arr
    }

    func run() {
        print(solution(0, 3))   // [0, 0, 0]
        print(solution(2, 5))   // [2, 4, 6, 8, 10]
        print(solution(4, 3))   // [4, 8, 12]
        print(solution(-4, 2))  // [-4, -8]
    }
}