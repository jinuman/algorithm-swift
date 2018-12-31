// 피보나치 수
// n번째 피보나치 수를 구하는 문제

import Foundation

class B_2747 {
    func run() {
        if let input = readLine() {
            let n = Int(input) ?? 0
            var arr = [Int].init(repeating: 0, count: n + 1)
            if n == 0 {
                print(0)
            } else if n > 0{
                arr[1] = 1
                for i in stride(from: 2, through: n, by: 1) {
                    arr[i] = arr[i - 1] + arr[i - 2]
                }
                print(arr.last ?? 0)
            }
        }
    }
}

// B_2747().run()

/*
input
10
output
55
*/