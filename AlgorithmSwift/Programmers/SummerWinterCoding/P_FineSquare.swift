// 멀쩡한 사각형
// Level 2

/* 문제
 가로 길이가 Wcm, 세로 길이가 Hcm 인 직사각형 종이를 누가 대각선으로 2등분이 되도록 잘라 놓았다.
 이 때, 사용할 수 있는 1cm x 1cm 정사각형의 return

 For example,
 w: 2, h: 2 -> 4 - 2 = 2 return
 */

/* 풀이
 반복되는 최소블록으로 나누었을 때, 최소 블록에서 잘려진 정사각형의 개수: width + height - 1
 최소블록의 width = w / gcd
 최소블록의 height = h / gcd
 최소블록의 개수는 gcd 만큼 존재한다.

 그러므로 식은 (w / gcd + h / gcd - 1) * gcd = w + h - gcd
 그러므로 전체 1x1 정사각형의 개수에서 위의 정사각형 개수를 빼면 `w * h - (w + h - gcd)` 라는 공식이 나온다.
 */

import Foundation

final class P_FineSquare {
    private func gcd(_ a: Int, _ b: Int) -> Int64 {
        if b == 0 {
            return Int64(a)
        }
        return gcd(b, a % b)
    }

    func solution(_ w: Int, _ h: Int) -> Int64 {
        let width = Int64(w)
        let height = Int64(h)
        var answer: Int64 = 0
        let gcdValue: Int64 = gcd(w, h)
        answer = width * height - (width + height - gcdValue)
        return answer
    }

    func run() {
        print(solution(8, 12)) // 80
        print(solution(2, 2)) // 2
    }
}
