import Foundation

class P_Level1_1 {
    func solution(_ arr:[Int], _ divisor:Int) -> [Int] {
        var answer = [Int]()
        arr.forEach {
            if $0 % divisor == 0 {
                answer.append($0)
            }
        }
        return answer.isEmpty ? [-1] : answer.sorted()
    }
    
    func run() {
        print(solution([5, 9, 7, 10], 5))
        print(solution([2, 36, 1, 3], 1))
        print(solution([3, 2, 6], 10))
    }
}

class TestAlgorithm {
    func run() {
        let arr: [Int] = [1, 3, 3]
        let unpairedNumber = arr.reduce(0, ^)
        print(unpairedNumber)  // 1
        
        
    }
}
