// 배열 합치기
// 시간 초과

import Foundation

class B_11728 {
    func run() {
        let line: [Int] = readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
        let n: Int = line[0]
        let m: Int = line[1]
        let a: [Int] = readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
        let b: [Int] = readLine()!.components(separatedBy: " ").map {
            Int($0)!
        }
        var sum = [Int].init(repeating: 0, count: n + m)
        var i = 0, j = 0, k = 0
        while i < n && j < m {
            if a[i] < b[j] {
                sum[k] = a[i]
                i += 1
            } else {
                sum[k] = b[j]
                j += 1
            }
            k += 1
        }
        while i < n {
            sum[k] = a[i]
            i += 1
            k += 1
        }
        while j < m {
            sum[k] = b[j]
            j += 1
            k += 1
        }
        sum.forEach { item in
            print(item, terminator: " ")
        }
    }
}

/*
2 2
3 5
2 9
*/