// Lesson 04 : Counting Elements

/*
 Check whether array A is a permutation.
 Permutation(순열): sequence containing each element from 1 to N once, and only once.

 순열인지 체크하는 문제
 순열이면 1 return, 순열이 아니면 0 return
 */

/*
 시간 복잡도: O(N)
 */

import Foundation

struct PermCheck {
    func solution(_ A: inout [Int]) -> Int {
        for (index, item) in A.sorted().enumerated() {
            if index + 1 != item {
                return 0
            }
        }
        return 1
    }

    private func functionalSolution(_ A: inout [Int]) -> Int {
        return A.sorted().enumerated()
            .filter { $0 + 1 != $1 }
            .isEmpty
            ? 1
            : 0
    }

    func run() {
        var testA1 = [4, 1, 3, 2]
        var testA2 = [4, 1, 3]
        print(solution(&testA1)) // 1
        print(solution(&testA2)) // 0
    }
}
