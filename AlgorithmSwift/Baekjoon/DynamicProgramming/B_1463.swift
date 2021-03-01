// 1로 만들기

/* 문제
 정수 X에 사용할 수 있는 연산은 다음과 같이 세 가지이다.

 1. X가 3으로 나누어 떨어지면, 3으로 나눈다.
 2. X가 2로 나누어 떨어지면, 2로 나눈다.
 3. 1을 뺀다.

 정수 N이 주어졌을 때, 위와 같은 연산 세 개를 적절히 사용해서 1을 만들려고 한다. 연산을 사용하는 횟수의 최솟값을 출력하시오.

 ex) 10의 경우에 10 -> 9 -> 3 -> 1 로 3번 만에 만들 수 있다.
 */

import Foundation

final class B_1463 {
    func run() {
        guard let n = Int(readLine() ?? "0") else { return }

        var memo: [Int] = Array(repeating: 0, count: n + 1)
        memo[1] = 0

        for i in stride(from: 2, through: n, by: 1) {
            memo[i] = memo[i - 1] + 1
            if i % 3 == 0 {
                memo[i] = min(memo[i], memo[i / 3] + 1)
            }
            if i % 2 == 0 {
                let calculated: Int = memo[i / 2] + 1
                if calculated < memo[i] {
                    memo[i] = calculated
                }
            }
        }
        print(memo[n])
    }
}

/*
input
1. 2
2. 10

output
1. 1
2. 3
*/
