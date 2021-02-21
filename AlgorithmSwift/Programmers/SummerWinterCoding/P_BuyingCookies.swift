// 쿠키 구입
// 2018년

/* 문제
 두 아들이 받아야 할 쿠키는 같아야 합니다.
 (1 <= l <= m, m + 1 <= r <= N) 에서 A[i] 를 i번 바구니에 들어있는 쿠키의 개수라고 했을 때,
 A[l] + ... + A[m] = A[m + 1] + ... + A[r] 을 만족해야 합니다.
 각 바구니 안에 들은 쿠키 수는 주어질 때, 조건에 맞게 쿠키를 살 경우 한명의 아들에게 줄 수 있는 가장 많은 쿠키 수는?
 (조건에 맞지 않을 경우 0 을 return)
 */

import Foundation

final class P_BuyingCookies {
    func solution(_ cookie: [Int]) -> Int {
        var answer = 0
        for i in stride(from: 0, to: cookie.count - 1, by: 1) {
            var left = i // <-
            var right = i + 1 // ->
            var leftSum = 0
            var rightSum = 0

            var visit: [Bool] = Array(repeating: false, count: cookie.count + 1)
            while 0 <= left && right < cookie.count {
                if !visit[left] {
                    leftSum += cookie[left]
                }
                visit[left] = true
                if !visit[right] {
                    rightSum += cookie[right]
                }
                visit[right] = true
                if leftSum < rightSum {
                    left -= 1
                } else if leftSum > rightSum {
                    right += 1
                } else {
                    if answer < leftSum { // 조건이 맞았는데 값이 더 크면 답 변경
                        answer = leftSum
                    }
                    left -= 1
                }
            }
        }
        return answer
    }


    func run() {
        print(solution([1, 1, 2, 3])) // 3
        print(solution([1, 2, 4, 5])) // 0
        print(solution([0, 3, 3, 3, 3, 3, 5, 5, 5, 6])) // 15
    }
}
