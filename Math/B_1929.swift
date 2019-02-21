// 소수 구하기
// 에라토스테네스의 체
// 1. 범위의 check 배열을 만든다.
// 2. 0번, 1번방을 true 로 하고, false 인 수 중 가장 작은 수를 찾는다.
// 3. 그 수는 이제 소수이다.
// 4. 이제 그 수의 배수는 모두 소수가 아니다.

import Foundation

class B_1929 {
    var isNotPrime = [Bool]()
    let MAX: Double = 1000000

    private func eratosthenes() {
        // true : 소수 아님
        isNotPrime = [Bool].init(repeating: false, count: Int(MAX) + 1)
        for i in 0...Int(sqrt(MAX)) {
            if i == 0 || i == 1 {
                isNotPrime[0] = true
                isNotPrime[1] = true
            }
            if isNotPrime[i] == false {
                for j in stride(from: i + i, through: Int(MAX), by: i) {
                    isNotPrime[j] = true
                }
            }
        }
    }

    func run() {
        let inputs = readLine()!.components(separatedBy: " ").map {
            Int($0) ?? 0
        }
        let m = inputs[0]
        let n = inputs[1]
        eratosthenes()
        for i in m...n {
            if !isNotPrime[i] {
                print(i)
            }
        }
    }
}

/*
input
3 16

output
3
5
7
11
13
*/