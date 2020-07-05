// Lesson 01 : Iterations

// Maximal Sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

import Foundation

struct BinaryGap {
    // 일반 버전
    func solution1(_ N: Int) -> Int {
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
    func solution2(_ N: Int) -> Int {
        let zero = CharacterSet.init(charactersIn: "0")
        let one = CharacterSet.init(charactersIn: "1")
        let binaryGap = String(N, radix: 2)
            .trimmingCharacters(in: zero)
            .trimmingCharacters(in: one)
            .split(separator: "1")
            .max()?
            .count
        
        guard let gap = binaryGap else {
            return 0
        }
        return gap
    }
    
    func run() {
        print(self.solution1(15))  // 0
        print(self.solution1(13))  // 1
        print(self.solution1(32))  // 0
        print(self.solution1(17))  // 3
        
        print(self.solution2(1))  // 0
        print(self.solution2(13))  // 1
        print(self.solution2(32))  // 0
        print(self.solution2(17))  // 3
        print(self.solution2(580)) // 3
    }
}
