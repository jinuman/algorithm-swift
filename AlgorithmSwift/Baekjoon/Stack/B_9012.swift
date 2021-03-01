// 괄호

/* 문제
 괄호의 짝이 맞으면 YES, 짝이 맞지 않으면 NO return
 */

struct B_9012 {
    func solution(_ input: String) -> String {
        var stack: [String.Element] = []
        for element in input {
            if element == "(" {
                stack.append(element)
            } else if element == ")" {
                if stack.isEmpty {
                    return "NO"
                }
                _ = stack.popLast()
            }
        }
        return stack.isEmpty ? "YES" : "NO"
    }

    func run() {
        for _ in stride(from: 0, to: Int(readLine()!)!, by: 1) {
            guard let input = readLine() else { break }
            print(solution(input))
        }
    }
}

/*
input
6
(())())
(((()())()
(()())((()))
((()()(()))(((())))()
()()()()(()()())()
(()((())()(

output
NO
NO
YES
NO
YES
NO
*/
