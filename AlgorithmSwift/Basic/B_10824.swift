// 네 수

import Foundation

final class B_10824 {
    func run() {
        guard let array: [String] = readLine()?.components(separatedBy: " ") else { return }
        let firstNumberString = array[0] + array[1]
        let secondNumberString = array[2] + array[3]
        print((Int(firstNumberString) ?? 0) + (Int(secondNumberString) ?? 0))
    }
}

/*
input
10 20 30 40

output
4060
*/
