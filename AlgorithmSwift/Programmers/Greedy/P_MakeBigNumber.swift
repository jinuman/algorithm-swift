// 큰 수 만들기

/* 문제
 어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하려 합니다.

 조건
 - number는 1자리 이상, 1,000,000자리 이하인 숫자
 - k는 1 이상 number의 자릿수 미만인 자연수

 For example,
 number: 1924, k: 2 -> return 94
 number: 1231234, k: 3 -> return 3234
 */

/* 풀이
 Solve using `stack` data structure
 */

struct P_MakeBigNumber {
    func solution(_ number: String, _ k: Int) -> String {
        let numbers = number.compactMap { Int($0.description) }
        let size = number.count - k
        var removeCount = k
        var stack = [Int]()

        for item in numbers {
            while removeCount > 0 {
                guard let top = stack.last,
                      top < item else { break }
                removeCount -= 1
                _ = stack.popLast()
            }
            stack.append(item)
        }
        return stack[0 ..< size].map { $0.description }.joined()
    }
    
    func run() {
        print(solution("1924", 2)) // 94
        print(solution("1231234", 3)) // 3234
        print(solution("4177252841", 4)) // 775841
        print(solution("10000", 2)) // 100
        print(solution("1000000", 1)) // 100000
    }
}
