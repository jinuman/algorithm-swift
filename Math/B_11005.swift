// 진법 변환 2

import Foundation

extension Array where Element == String {
    func concatenate() -> String {
        return self.reduce("", {$0 + $1 + ""})
    }
}

class B_11005 {
    func run() {
        let arr = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").map {
            String($0)
        }
        guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }) else {
            return
        }
        var N = input[0]
        let B = input[1]
        var result = [String]()
        while N != 0 {
            result.append((arr[N % B]))
            N /= B
        }
        print(String(result.concatenate().reversed()))
    }
}

/*
input
60466175 36

output
ZZZZZ
*/