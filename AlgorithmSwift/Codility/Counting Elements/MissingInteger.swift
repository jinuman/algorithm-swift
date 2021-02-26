// Lesson 04 : Counting Elements

/*
 A 배열에 없는 가장 작은 양의 정수 return
 */

/*
 시간 복잡도: O(N)
 */

import Foundation

struct MissingInteger {
    func solution(_ A: inout [Int]) -> Int {
        var minNumber = 1
        for number in A.sorted() {
            if number == minNumber {
                minNumber += 1
            }
        }
        return minNumber
    }

    func run() {
        var testA1 = [1, 2, 3]
        var testA2 = [-1, -3]
        print(solution(&testA1)) // 4
        print(solution(&testA2)) // 1
    }
}
