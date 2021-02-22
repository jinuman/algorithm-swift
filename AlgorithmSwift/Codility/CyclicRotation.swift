// Lesson 02 : Arrays

/*
 배열을 K 번 오른쪽으로 shift 시킨 배열을 return 하는 문제
 */

import Foundation

struct CyclicRotation {
    func solution(_ A: inout [Int], _ K: Int) -> [Int] {
        var resultArray = [Int].init(repeating: 0, count: A.count)
        let size = A.count
        
        for i in stride(from: 0, to: size, by: 1) {
            let index = (i + K) % size
            resultArray[index] = A[i]
        }
        
        return resultArray
    }
    
    func run() {
        var testArray1 = [3, 8, 9, 7, 6]
        print(solution(&testArray1, 3)) // [9, 7, 6, 3, 8]
        
        var testArray2 = [1, 2, 3, 4]
        print(solution(&testArray2, 4)) // [1, 2, 3, 4]
    }
}
