// Lesson 03 : Time Complexity

import Foundation

class FrogJmp {
    func solution(_ X: Int, _ Y: Int, _ D: Int) -> Int {
        let distance = abs(Y - X)
        return distance % D == 0
            ? distance / D
            : distance / D + 1
    }
    
    func run() {
        print(solution(10, 85, 30)) // 3
    }
}
