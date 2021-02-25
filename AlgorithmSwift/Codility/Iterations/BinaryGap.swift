// Lesson 01 : Iterations

/*
 Maximal Sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.
 Longest binary gap(1 과 1 사이의 0이 몇개인지) 구하는 문제
 given N: 529 = binary: 1000010001
 return 4
 */

import Foundation

struct BinaryGap {
    // 일반 버전
    func solution(_ N: Int) -> Int {
        var number = N
        var maxBinaryGap: Int = 0
        var countBinaryGap: Int = 0
        var isFirstOneAppeared: Bool = false
        
        while number != 0 {
            if number & 1 == 1 {  // 자리수가 1이면
                if !isFirstOneAppeared {
                    isFirstOneAppeared = true
                } else {
                    // 최초의 1이 나온 후부터 계산
                    maxBinaryGap = max(maxBinaryGap, countBinaryGap)
                }
                countBinaryGap = 0
            } else {
                countBinaryGap += 1
            }
            number = number >> 1
        }
        return maxBinaryGap
    }
    
    // 함수형 버전
    func functionalSolution(_ N: Int) -> Int {
        let zero = CharacterSet(charactersIn: "0")
        let one = CharacterSet(charactersIn: "1")
        let binaryGapCount = String(N, radix: 2)
            .trimmingCharacters(in: zero)
            .trimmingCharacters(in: one)
            .split(separator: "1")
            .max()?
            .count
        
        guard let answer = binaryGapCount else {
            return 0
        }
        return answer
    }
    
    func run() {
        print(solution(15))  // 0
        print(solution(13))  // 1
        print(solution(32))  // 0
        print(solution(17))  // 3
        
        print(functionalSolution(1))  // 0
        print(functionalSolution(13))  // 1
        print(functionalSolution(32))  // 0
        print(functionalSolution(17))  // 3
        print(functionalSolution(529)) // 4
    }
}
