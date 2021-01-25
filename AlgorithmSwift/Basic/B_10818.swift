// 최소, 최대

import Foundation

final class B_10818 {
    func run() {
        guard let _ = readLine(),
              let line = readLine()?.components(separatedBy: " ") else { return }

        let numbers: [Int] = line.compactMap { Int($0) }
        var max = Int.min
        var min = Int.max
        for number in numbers {
            max = (number > max) ? number : max
            min = (number < min) ? number : min
        }
        print(min, max)
    }
}

/*
input
5
20 10 35 30 7

output
7 35
*/
