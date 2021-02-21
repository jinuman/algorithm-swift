// 소수 만들기
// 2018년

import Foundation

final class P_MakePrimeNumber {
    private func isPrimeNumber(_ number: Int) -> Bool {
        return number > 1 && !(2 ..< number).contains { number % $0 == 0 }
    }

    func solution(_ nums: [Int]) -> Int {
        var sumOfNumbers: [Int] = []
        for i in stride(from: 0, to: nums.count, by: 1) {
            for j in stride(from: i + 1, to: nums.count, by: 1) {
                for k in stride(from: j + 1, to: nums.count, by: 1) {
                    sumOfNumbers.append(nums[i] + nums[j] + nums[k])
                }
            }
        }
        return sumOfNumbers.filter { isPrimeNumber($0) }.count
    }

    func run() {
        print(solution([1, 2, 3, 4])) // 1
        print(solution([1, 2, 7, 6, 4])) // 4
    }
}
