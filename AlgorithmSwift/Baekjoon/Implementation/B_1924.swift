// 2007년

import Foundation

class B_1924 {
    func run() {
        let days = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
        let months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
        var totalDays: Int = 0
        
        guard let inputs = readLine()?.components(separatedBy: " ") else { return }
        let date = inputs.compactMap { Int($0) }
        let month = date[0]
        let day = date[1]
        totalDays = months[0..<month - 1].reduce(0, { $0 + $1 }) + day
        print(days[totalDays % 7])
    }
}

/*
input
1 1

output
MON
*/
