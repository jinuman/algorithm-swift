// 최소, 최대

import Foundation

class B10818 {
    func run() {
        if let _ = readLine() {
            guard let line = readLine() else { return }
            let inputs: [Int] = line.split(separator: " ").map {
                Int($0)!
            }
            var max: Int = -1000000
            var min: Int = 1000000
            for item in inputs {
                max = (item > max) ? item : max
                min = (item < min) ? item : min
            }
            print(min, max)
        }
    }
}

//B10818().run()

/*
5
20 10 35 30 7
*/