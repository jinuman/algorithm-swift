// 문자열 압축하기

/* 문제
 주어진 문자열에서 S라는 문자열이 k번 반복될 경우 k(S)와 같은 식으로 표현할 수 있다.
 문자열이 주어졌을 때, 가장 짧은 방법의 길이 return

 조건:
 문자열의 길이는 200자를 넘지 않으며 공백 없이 주어진다.
 압축하지 않은 경우가 더 짧은 경우에는 원래 문자열의 길이를 출력한다.

 For example,
 nowletsgogogoletsgogogo -> now2(lets3(go))
 */

/* 풀이
 memo[i][j] = i 부터 j 까지의 최소 길이
 길이의 진약수를 모두 구하여 저장한다. 예를들면, gogogogo 의 길이는 8이고, 4(go) or 2(gogo) 의 경우가 있을 수 있다. (segment)
 */

import Foundation

struct B_2135 {
    private func canCompress(_ input: String, _ start: Int, _ end: Int, _ segment: Int) -> Bool {
        for i in stride(from: start, to: end, by: segment) {
            if input[start ..< start + segment] != input[i ..< i + segment] {
                return false
            }
        }
        return true
    }

    func solution(_ input: String) -> Int {
        var memo = Array(
            repeating: Array(
                repeating: 0,
                count: input.count + 1
            ),
            count: input.count + 1
        )
        for i in stride(from: 0, to: input.count, by: 1) {
            memo[i][i + 1] = 1
        }
        for size in stride(from: 2, to: input.count + 1, by: 1) {
            let segments: [Int] = (1 ..< size).filter { size % $0 == 0 }
            for start in stride(from: 0, through: input.count - size, by: 1) {
                var compressed = size // 압축한 구간의 길이
                for segment in segments {
                    if canCompress(input, start, start + size, segment) {
                        compressed = min(
                            compressed,
                            2 + memo[start][start + segment] + (size / segment).description.count
                        )
                    }
                }
                for j in stride(from: start + 1, to: size + start, by: 1) {
                    compressed = min(compressed, memo[start][j] + memo[j][size + start])
                }
                memo[start][start + size] = compressed
            }
        }
        return memo[0][input.count]
    }

    func run() {
        guard let input = readLine() else { return }
        print(solution(input))
    }
}

private extension String {
    subscript(i: Int) -> String {
        return self[i ..< i + 1]
    }

    subscript(range: Range<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)

        return String(self[startIndex ..< endIndex])
    }

    subscript(range: ClosedRange<Int>) -> String {
        let startIndex = self.index(self.startIndex, offsetBy: range.lowerBound)
        let endIndex = self.index(self.startIndex, offsetBy: range.upperBound)

        return String(self[startIndex ... endIndex])
    }
}


/*
input
letsgogogo

output
9
*/
