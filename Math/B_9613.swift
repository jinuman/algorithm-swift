// GCD 합

import Foundation

class B_9613 {
    private func gcd(_ num1: Int, _ num2: Int) -> Int {
        var a = num1
        var b = num2
        while b != 0 {
            let r = a % b
            a = b
            b = r
        }
        return a
    }

    func run() {
        let tc: Int = Int(readLine()!)!
        var cases = [String]()
        for _ in 0..<tc {
            cases.append(readLine()!)
        }
        for i in 0..<tc {
            var arr: [Int] = cases[i].components(separatedBy: " ").map {
                Int($0) ?? -1
            }
            let n: Int = arr.first ?? -1
            arr.remove(at: 0)
            var result: Int = 0
            for i in stride(from: 0, to: n - 1, by: 1) {
                for j in stride(from: i + 1, to: n, by: 1) {
                    result += gcd(arr[i], arr[j])
                }
            }
            print(result)
        }
    }
}

/*
input
3
4 10 20 30 40
3 7 5 12
3 125 15 25

output
70
3
35
*/
