// Lesson 03 : Time Complexity

/*
 returns the minimal difference between the sum of first part and the sum of second part
 return minimal of |(A[0] + A[1] + ... + A[P - 1]) - (A[P] + A[P + 1] + ... A[N - 1])|
 */

import Foundation

struct TapeEquilibrium {
    func solution(_ A: inout [Int]) -> Int {
        var leftSum = 0
        var rightSum = 0
        let allSum = A.reduce(0, +)
        var diffs: [Int] = []

        for i in stride(from: 1, to: A.count, by: 1) {
            leftSum += A[i - 1]
            rightSum = allSum - leftSum
            diffs.append(abs(leftSum - rightSum))
        }
        guard let answer = diffs.min() else { return 0 }
        return answer
    }
    
    func run() {
        var testArray1 = [3, 1, 2, 4, 3]
        print(solution(&testArray1)) // 1
    }
}
