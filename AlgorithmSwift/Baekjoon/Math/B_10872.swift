// 팩토리얼

import Foundation

class B_10872 {
    func run() {
        guard let num: Int = Int(readLine() ?? "0") else { return }
        print((1...max(num, 1)).reduce(1, *))
    }
}

/*
input
10

output
3628800
*/
