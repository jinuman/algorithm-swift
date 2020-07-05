// Lesson 02 : Arrays

import Foundation

class CyclicRotation {
    
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
        print(self.solution(&testArray1, 3))
        
        var testArray2 = [1, 2, 3, 4]
        print(self.solution(&testArray2, 4))
    }
}
