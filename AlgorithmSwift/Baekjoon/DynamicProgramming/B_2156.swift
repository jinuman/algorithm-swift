// 포도주 시식

/* 문제
 규칙
 1. 포도주 잔을 선택하면 그 잔을 모두 마셔야한다.
 2. 연속으로 놓여있는 3잔을 모두 마실 수는 없다.

 1 ~ n 까지의 번호가 붙어 있는 n 개의 포도주 잔이 순서대로 테이블 위에 놓여있고,
 각 포도주 잔에 들어있는 포도주의 양이 주어졌을 때, 최대로 마실 수 있는 포도주의 양 return

 조건:
 포도주 잔의 개수 n: (1 <= n <= 10,000)
 포도주 양은 1,000 이하의 음이 아닌 정수

 For example,
 포도주 양: [6, 10, 13, 9, 8, 1] -> (6 + 10) + (9 + 8) = 33이 최대 양
 */

/* 풀이
 `memo[i] = wines[i] 까지 마셨을 때, 마실 수 있는 포도주의 최대 양`으로 정하고

 이 문제에서 만약 연속 3잔 마시면 안되는 조건이 없었다면,
 - i번째 포도주를 마시는 경우: memo[i] = memo[i - 1] + wines[i]
 - i번째 포도주를 마시지 않는 경우: memo[i] = memo[i - 1]
 그러므로 memo[i] = max(i번째 포도주를 마시는 경우, i번째 포도주를 마시지 않는 경우)가 된다.

 그러나 이 문제에선 연속 3잔은 마시면 안되는 조건이 있으므로 다르게 처리해야 한다.

 - 0번 연속해서 마신 포도주 -> wines[i]를 마시지 않음
     = memo[i - 1]
 - 1번 연속해서 마신 포도주 -> wines[i - 1]을 마시지 않았어야 함
     = memo[i - 2] + wines[i]
 - 2번 연속해서 마신 포도주 -> wines[i - 1]을 마시고, wines[i - 2]는 마시지 않았어야 함
     = memo[i - 3] + wines[i - 1] + wines[i]

 그러므로 memo[i] = max(0번 연속해서 마신 포도주, 1번 연속해서 마신 포도주, 2번 연속해서 마신 포도주)

 i - 1, i - 2 때문에 예외처리가 예상되기 때문에,
 - memo[1] = wines[1]
 - memo[2] = wines[1] + wines[2]
 로 미리 처리해두고 i = 3 인 경우부터 시작하는 것이 좋다.
 */

import Foundation

final class B_2156 {
    var memo: [Int] = []

    func solution(_ n: Int, _ wines: [Int]) -> Int {
        if n == 1 || n == 2 {
            return wines.reduce(0, +)
        }
        if n >= 2 {
            memo[1] = wines[1]
            memo[2] = wines[1] + wines[2]
        }
        for i in stride(from: 3, through: n, by: 1) {
            // 0번 연속
            memo[i] = memo[i - 1]

            // 1번 연속
            if memo[i] < memo[i - 2] + wines[i] {
                memo[i] = memo[i - 2] + wines[i]
            }

            // 2번 연속
            if memo[i] < memo[i - 3] + wines[i - 1] + wines[i] {
                memo[i] = memo[i - 3] + wines[i - 1] + wines[i]
            }
        }
        return memo[n]
    }

    func run() {
        let n = Int(readLine()!)!
        memo = [Int](repeating: 0, count: n + 1)
        var wines = [Int](repeating: 0, count: n + 1)
        for i in stride(from: 1, through: n, by: 1) {
            wines[i] = Int(readLine()!)!
        }
        print(solution(n, wines))
    }
}

/*
input
6
6
10
13
9
8
1

output
33
*/
