// 그대로 출력하기 2

import Foundation

class B_11719 {
    func run() {
        var lineNum: Int = 100
        while lineNum != 0 {
            lineNum -= 1
            guard let line = readLine() else {
                break
            }
            print(line)
        }
    }
}

/*
    Hello

Baekjoon
   Online Judge
*/