// 숫자의 합
// compactMap, reduce 활용

import Foundation

final class B_11720 {
    func run() {
        guard let line = readLine() else { return }
        
        let numbers = Array(line).compactMap { Int(String($0)) }
        print(numbers.reduce(0, +))
    }
}

/*
input
5
54321

output
15
*/
