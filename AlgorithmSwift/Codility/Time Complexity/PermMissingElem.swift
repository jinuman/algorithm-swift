// Lesson 03 : Time Complexity

/*
 An array A consisting of N different integers in given.
 The array contains integers in the range [1...(N + 1)], which means that exactly one element is missing.
 Your goal is to find that missing element.
 */

import Foundation

struct PermMissingElem {
    func solution(_ A: inout [Int]) -> Int {
        let allSum = (1 ... A.count + 1).reduce(0, +)
        let aSum = A.reduce(0, +)
        return allSum - aSum
    }

    // array 의 크기가 클 경우 효율성에서 점수가 깎임
    private func functionalSolution(_ A: inout [Int]) -> Int {
        let A = A
        return (1 ... A.count + 1).lazy.filter { !A.contains($0) }.first ?? 0
    }
    
    func run() {
        var testArray1 = [2, 3, 1, 5]
        var testArray2 = [3, 4, 1, 5]
        var testArray3: [Int] = []
        print(solution(&testArray1))  // 4
        print(solution(&testArray2))  // 2
        print(solution(&testArray3))  // 1
    }
}
