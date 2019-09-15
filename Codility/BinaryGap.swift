// Task 01 : Iterations

// Maximal Sequence of consecutive zeros that is surrounded by ones at both ends in the binary representation of N.

import Foundation

class BinaryGap {
    // 일반 버전
    func solution1(_ N: Int) -> Int {
        var number = N
        var maxBinaryGap: Int = 0
        var countBinaryGap: Int = 0
        var countFlag: Bool = false
        
        while number != 0 {
            if number & 1 == 1 {  // 자리수가 1이면
                if !countFlag {
                    countFlag = true
                } else {
                    // 최초의 1이 나온 후부터 계산을 적용한다.
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
        let cs0 = CharacterSet.init(charactersIn: "0")
        let cs1 = CharacterSet.init(charactersIn: "1")
        let binaryGap = String(N, radix: 2)
            .trimmingCharacters(in: cs0)
            .trimmingCharacters(in: cs1)
            .split(separator: "1")
            .max()?.count
        
        guard let gap = binaryGap else {
            return 0
        }
        return gap
    }
    
    func run() {
        print(solution1(15))  // 0
        print(solution1(13))  // 1
        print(solution1(32))  // 0
        print(solution1(17))  // 3
        
        print(solution2(15))  // 0
        print(solution2(13))  // 1
        print(solution2(32))  // 0
        print(solution2(17))  // 3
        print(solution2(580)) // 3
    }
}
