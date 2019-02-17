// 최소, 최대

import Foundation

class B_10818 {
    func run() {
        if let _ = readLine() {
            guard let line = readLine() else {
                return
            }
            let array: [Int] = line.components(separatedBy: " ").map {
                Int($0)!
            }
            var max: Int = -1000000
            var min: Int = 1000000
            for item in array {
                max = (item > max) ? item : max
                min = (item < min) ? item : min
            }
            print(min, max)
        }
    }
}

//B_10818().run()

/*
5
20 10 35 30 7
*/