// 네 수

import Foundation

class B_10824 {
    func run() {
        guard let array: [String] = readLine()?.components(separatedBy: " ") else { return }
        let str1 = array[0] + array[1]
        let str2 = array[2] + array[3]
        print((Int(str1) ?? 0) + (Int(str2) ?? 0))
    }
}

/*
input
10 20 30 40

output
4060
*/
