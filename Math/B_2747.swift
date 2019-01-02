// 피보나치 수
// n번째 피보나치 수를 구하는 문제

import Foundation

class B_2747 {
    var arr: [Int] = [0, 1]
    func run() {
        guard
                let input = readLine(),
                let n = Int(input)
                else { return }
        if n == 0 || n == 1 {
            print(arr[n])
        } else {
            for i in stride(from: 2, through: n, by: 1) {
                arr.append(arr[i - 1] + arr[i - 2])
            }
            print(arr[n])
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