// 소수 구하기
// 에라토스테네스의 체
// 1. 범위의 isPrime Bool 타입 배열을 만들고 true 로 초기화한다.
// 2. 0번, 1번방을 false 로 하고, true 인 수 중 가장 작은 수를 찾는다.
// 3. 그 수는 이제 소수이다.
// 4. 이제 그 수의 배수는 모두 소수가 아니다.

import Foundation

class B_1929 {
    private var isPrime = [Bool]()

    private func eratosthenes(max: Int) {
        isPrime = [Bool].init(repeating: true, count: max + 1)
        for i in 0 ... max {
            if i == 0 || i == 1 {
                isPrime[0] = false
                isPrime[1] = false
            }
            if isPrime[i] {
                for j in stride(from: i + i, through: max, by: i) {
                    isPrime[j] = false
                }
            }
        }
    }

    func run() {
        guard let line = readLine()?.components(separatedBy: " ") else { return }
        let inputs = line.compactMap { Int($0) }
        let start: Int = inputs[0]
        let end: Int = inputs[1]
        
        eratosthenes(max: end)
        
        for i in (start...end) {
            if isPrime[i] {
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
