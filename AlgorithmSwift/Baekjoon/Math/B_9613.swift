// GCD 합

/* 문제
 GCD: 최대 공약수
 양의 정수 n 개가 주어질 때, 가능한 모든 쌍의 GCD 합을 구하시오.

 For example,
 3(n) 2 6 12 이면,
 - gcd(2, 6) = 2
 - gcd(2, 12) = 2
 - gcd(6, 12) = 6
 총 10 return
 */

import Foundation

struct B_9613 {
    private func iterativeGCD(_ num1: Int, _ num2: Int) -> Int {
        var a = num1
        var b = num2
        while b != 0 {
            let r = a % b
            a = b
            b = r
        }
        return a
    }

    private func recursiveGCD(_ a: Int, _ b: Int) -> Int {
        if b == 0 {
            return a
        }
        return recursiveGCD(b, a % b)
    }

    func run() {
        let testcase = Int(readLine()!)!

        for _ in 0 ..< testcase {
            var numbers: [Int] = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
            let n = numbers.removeFirst()
            var answer = 0

            for i in stride(from: 0, to: n - 1, by: 1) {
                for j in stride(from: i + 1, to: n, by: 1) {
                    answer += recursiveGCD(numbers[i], numbers[j])
                }
            }
            print(answer)
        }
    }
}

/*
input
4
4 10 20 30 40
3 7 5 12
3 125 15 25
3 2 6 12

output
70
3
35
10
*/
