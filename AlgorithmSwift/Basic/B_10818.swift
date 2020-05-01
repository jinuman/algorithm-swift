// 최소, 최대

import Foundation

class B_10818 {
    func run() {
        guard
            let _ = readLine(),
            let line = readLine()?.components(separatedBy: " ") else { return }
        
        let array: [Int] = line.compactMap { Int($0) }
        
        var max: Int = -1000000
        var min: Int = 1000000
        for item in array {
            max = (item > max) ? item : max
            min = (item < min) ? item : min
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
