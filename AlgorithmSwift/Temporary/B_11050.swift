// 이항 계수 1
// 조합 nCk 를 구하는 문제
// error : 런타임 에러...

import Foundation

final class B_11050 {
    private func combination(_ n: Int, _ k: Int) -> Int {
        if n == k || k == 0 {
            return 1
        }
        return combination(n - 1, k - 1) + combination(n - 1, k)
    }
    
    func run() {
        let line = readLine()!.split(separator: " ").map {
            Int($0)!
        }
        let n: Int = line[0]
        let k: Int = line[1]
        print(combination(n, k))
    }
}

/*
 input
 5 2
 
 output
 10
 */

