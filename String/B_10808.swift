// 알파벳 개수
// firstIndex(of:), joined(separator:)

import Foundation

class B_10808 {
    func run() {
        guard let input = readLine() else {
            return
        }
        let alphabetArr = Array("abcdefghijklmnopqrstuvwxyz")
        var cntArr = [Int].init(repeating: 0, count: alphabetArr.count)
        input.forEach { ch in
            let idx = alphabetArr.firstIndex(of: ch) ?? -1
            cntArr[idx] += 1
        }
        print(cntArr.map {
            String($0)
        }.joined(separator: " "))
    }
}

//B_10808().run()

/*
input
baekjoon

output
1 1 0 0 1 0 0 0 0 1 1 0 0 1 2 0 0 0 0 0 0 0 0 0 0 0
*/