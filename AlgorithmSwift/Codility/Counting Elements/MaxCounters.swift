// Lesson 04 : Counting Elements

/*
 You are given N counters, initially set to 0, and you have two possible operations on them.
 K in A[K] is operation.
 1. increase(X): counter X is increased by 1 when A[K] = X, 1 <= X <= N
 2. max counter: all counters are set to the maximum value of any counter when A[K] = N + 1

 The goal is to calculate the value of every counter after all operations.

 For example, given integer N = 5 and array A such that:
 A[0] = 3
 A[1] = 4
 A[2] = 4
 A[3] = 6
 A[4] = 1
 A[5] = 4
 A[6] = 4
 the values of the counters after each consecutive operation will be:
 (0, 0, 1, 0, 0)
 (0, 0, 1, 1, 0)
 (0, 0, 1, 2, 0)
 (2, 2, 2, 2, 2)
 (3, 2, 2, 2, 2)
 (3, 2, 2, 3, 2)
 (3, 2, 2, 4, 2) <- return
 */

/*
 counters: [Int] 의 초기화를 최소화해야 효율성에서 만점을 받을 수 있습니다.
 시간 복잡도: O(N + M)
 */

import Foundation

struct MaxCounters {
    /// 66%
    func solution(_ N: Int, _ A: inout [Int]) -> [Int] {
        var counters = [Int](repeating: 0, count: N)
        for item in A {
            if 1 <= item, item <= N {
                counters[item - 1] += 1
            } else if item == N + 1 {
                guard let maxNumber = counters.max(),
                      maxNumber > 0 else { continue }
                counters = counters.map { _ in maxNumber }
            }
        }
        return counters
    }

    /// 100%
    private func efficientSolution(_ N: Int, _ A: inout [Int]) -> [Int] {
        var counters = [Int](repeating: 0, count: N)
        var tempMaxCounter = 0
        var maxCounter = 0
        for item in A {
            if 1 <= item, item <= N {
                if counters[item - 1] < maxCounter {
                    counters[item - 1] = maxCounter
                }
                counters[item - 1] += 1
                if counters[item - 1] > tempMaxCounter {
                    tempMaxCounter = counters[item - 1]
                }
            } else if item == N + 1 {
                maxCounter = tempMaxCounter
            }
        }
        if maxCounter > 0 {
            for (index, item) in counters.enumerated() {
                counters[index] = max(maxCounter, item)
            }
        }
        return counters
    }

    func run() {
        var testA1 = [3, 4, 4, 6, 1, 4, 4]
        var testA2 = [2, 6, 6, 6, 1, 3, 6, 6]
        var testA3 = [6, 6, 6, 6, 6, 6, 6, 6]
        print(efficientSolution(5, &testA1)) // [3, 2, 2, 4, 2]
        print(efficientSolution(5, &testA2)) // [2, 2, 2, 2, 2]
        print(efficientSolution(5, &testA3)) // [0, 0, 0, 0, 0]
    }
}
