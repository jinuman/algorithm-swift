// 문자열 압축하기
// 2018년 상반기 1번
// RLE (Run Length Encoding)

import Foundation

class Line_RLE {
    func rle(_ str: String) -> String {
        var result: String = ""
        var cnt: Int = 0
        var target = str.first!
        for (idx, value) in str.enumerated() {
            if target == value {
                cnt += 1
            } else {
                result = result + String(cnt) + String(target)
                cnt = 1
                target = value
            }
            if idx == str.count - 1 {
                result = result + String(cnt) + String(target)
            }
        }
        return result
    }

    func run() {
        if let t = Int(readLine() ?? "0") {
            for _ in 0..<t {
                let str: String = readLine() ?? ""
                print(rle(str))
            }
        }
    }
}

/*
input
2
AAAAAADDC
WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW

output
6A2D1C
12W1B12W3B24W1B14W
*/