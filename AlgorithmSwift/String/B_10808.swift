// 알파벳 개수
// firstIndex(of:), joined(separator:)

import Foundation

class B_10808 {
    func run() {
        guard let input = readLine() else { return }
        let alphabets = Array("abcdefghijklmnopqrstuvwxyz")
        var result = [Int].init(repeating: 0, count: alphabets.count)
        input.forEach { ch in
            guard let idx = alphabets.firstIndex(of: ch) else { return }
            result[idx] += 1
        }
        print(result.map { String($0) }
            .joined(separator: " "))
    }
}

/*
input
baekjoon

output
1 1 0 0 1 0 0 0 0 1 1 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0
*/
