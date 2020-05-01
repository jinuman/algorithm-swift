// Task 02 : Arrays

// 배열 A 의 모든 원소를 xor 비트연산 시킬 경우 짝이 없는 숫자만 남게된다.

import Foundation

class OddOccurrencesInArray {
    func solution(_ A: inout [Int]) -> Int {
        return A.reduce(0, ^)
    }
    
    func run() {
        var testArray = [9, 3, 9, 3, 9, 7, 9]
        print(solution(&testArray))  // 7
    }
}
