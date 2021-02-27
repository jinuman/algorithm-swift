// Lesson 04 : Counting Elements

/*
 A[K]에서 K는 seconds를 의미하고, A[K] 값은 leaf가 떨어진 위치를 의미합니다.
 X가 5라면 leaf는 (1, 2, 3, 4, 5)에 모두 떨어져 있어야 개구리가 강을 건널 수 있습니다.
 개구리가 강을 건널 수 있는 최소 시간 K를 return

 X의 범위는 [1 ... 100,000]
 each element of array A is an integer within the range [1 ... X]
 */

/*
 시간 복잡도: O(N)
 */

import Foundation

struct FrogRiverOne {
    func solution(_ X: Int, _ A: inout [Int]) -> Int {
        var answer = -1
        var leafSet = Set<Int>()
        for (offset, element) in A.enumerated() {
            leafSet.insert(element)
            if leafSet.count == X {
                answer = offset
                break
            }
        }
        return answer
    }

    func run() {
        var testA1 = [1, 3, 1, 4, 2, 3, 5, 4]
        var testA2 = [1, 1, 1, 1, 1]
        print(solution(5, &testA1)) // 6
        print(solution(2, &testA2)) // -1
    }
}
