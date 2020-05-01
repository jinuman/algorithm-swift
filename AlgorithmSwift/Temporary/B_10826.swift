// 피보나치 수 4
// 0 <= n && n <= 10000
// 런타임 에러 ..

import Foundation

class B_10826 {
    private var dic: [Int: Int64] = {
        let dic: [Int : Int64] = [
            0 : 0,
            1 : 1,
            2 : 1
            ]
        return dic
    }()

    private func fibonacci(_ n: Int) -> Int64 {
        if dic.keys.contains(n) {
            return dic[n] ?? -1
        } else {
            let next = fibonacci(n - 1) + fibonacci(n - 2)
            dic[n] = next
            return next
        }
    }

    func run() {
        let n = Int(readLine()!)!
        print(fibonacci(n))
    }
}

/*
input
10

output
55
*/