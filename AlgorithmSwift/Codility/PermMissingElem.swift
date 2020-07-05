// Lesson 03 : Time Complexity

import Foundation

class PermMissingElem {
    func solution(_ A: inout [Int]) -> Int {
        let sum = (0 ... A.count + 1).reduce(0, +)
        let sumOfA = A.reduce(0, +)
        return sum - sumOfA
    }
    
    func run() {
        var testArray1 = [2, 3, 1, 5]
        var testArray2 = [3, 4, 1, 5]
        print(solution(&testArray1))  // 4
        print(solution(&testArray2))  // 2
    }
}
