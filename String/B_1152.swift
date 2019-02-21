// 단어의 개수
// split 함수는 디폴트로 공백을 생략한다. omittingEmptySubsequences = true

import Foundation

class B_1152 {
    func run() {
        guard let input = readLine() else {
            return
        }
        print(input.split(separator: " ").count)
    }
}

/*
input
 Mazatneunde Wae Teullyeoyo

output
3
*/