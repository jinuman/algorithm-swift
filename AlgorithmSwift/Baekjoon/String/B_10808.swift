// 알파벳 개수

/* 문제
 알파벳 소문자로만 이루어진 단어 S가 주어진다. 각 알파벳이 단어에 몇 개가 포함되어 있는지 구하는 프로그램을 작성하시오.
 */

// firstIndex(of:), joined(separator:)

struct B_10808 {
    func solution(_ input: String) -> String {
        let alphabets = Array("abcdefghijklmnopqrstuvwxyz")
        var check = [Int](repeating: 0, count: alphabets.count)
        for element in input {
            guard let index = alphabets.firstIndex(of: element) else { break }
            check[index] += 1
        }
        let answer = check.map { $0.description }.joined(separator: " ")
        return answer
    }

    func run() {
        guard let input = readLine() else { return }
        print(solution(input))
    }
}

/*
 input
 baekjoon

 output
 1 1 0 0 1 0 0 0 0 1 1 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0
 */
