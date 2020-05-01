// 하노이 탑 이동 순서
// n 개를 a -> c 이동하는 방법
// Divide And Conquer

// Step 1 : n - 1 개를 a -> b 이동
// Step 2 : n 을 a -> c 이동
// Step 3 : n - 1 개를 b -> c 이동

import Foundation

class B_11729 {
    private func moveHanoi(_ n: Int, _ a: Int, _ c: Int) {
        if n == 0 {
            return
        }
        let b: Int = 6 - a - c  // 문제에서 a : 1, b : 2, c : 3
        moveHanoi(n - 1, a, b)
        print(a, c)
        moveHanoi(n - 1, b, c)
    }
    
    func run() {
        let n = Int(readLine()!)!
        print(pow(2, n) - 1)
        moveHanoi(n, 1, 3)
    }
}

/*
 input
 3
 
 output
 7
 1 3
 1 2
 3 2
 1 3
 2 1
 2 3
 1 3
 */
