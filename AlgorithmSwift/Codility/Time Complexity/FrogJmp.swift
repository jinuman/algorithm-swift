// Lesson 03 : Time Complexity

/*
 개구리는 D 만큼 점프할 수 있다.
 X 위치에서 시작했을 때 Y 지점 이상으로 도달하기 위해 점프하는 최소 횟수 return
 */

import Foundation

struct FrogJmp {
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
