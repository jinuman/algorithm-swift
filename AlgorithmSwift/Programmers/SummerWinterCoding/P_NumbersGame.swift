// 숫자 게임
// 2018년

import Foundation

final class P_NumbersGame {
    func solution(_ a: [Int], _ b: [Int]) -> Int {
        var answer = 0
        let aNumbers = a.sorted()
        let bNumbers = b.sorted()
        var bIndex = 0

        for i in stride(from: 0, to: aNumbers.count, by: 1) {
            for j in stride(from: bIndex, to: bNumbers.count, by: 1) {
                if aNumbers[i] < bNumbers[j] {
                    answer += 1
                    bIndex = j + 1
                    break
                }
            }
        }
        return answer
    }

    private func goodSolution(_ a: [Int], _ b: [Int]) -> Int {
        let aNumbers = a.sorted()
        let bNumbers = b.sorted()
        var index = 0

        for bNumber in bNumbers {
            if bNumber > aNumbers[index] {
                index += 1
            }
        }
        return index
    }

    func run() {
        print(goodSolution([5, 1, 3, 7], [2, 2, 6, 8])) // 3
        print(goodSolution([2, 2, 2, 2], [1, 1, 1, 1])) // 0
        print(goodSolution([5, 1, 3, 7], [1, 2, 6, 8])) // 3
    }
}
