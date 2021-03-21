// 진법 변환
// B진수 to 10진수

import Foundation

final class B_2745 {
    func run() {
        let arr = Array("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ").map({ String($0) })
        guard let input = readLine()?.split(separator: " ").map({ String($0.uppercased()) }) else { return }
        
        let N: String = input[0]
        let B: Int = Int(input[1]) ?? 0
        
        var exponential: Int = N.count - 1     // 앞에서 부터 계산
        var answer: Int = 0
        
        N.forEach {
            guard let num: Int = arr.firstIndex(of: String($0)) else { return }
            answer += num * B.power(exponential)
            exponential -= 1
        }
        print(answer)
    }
}

/*
input
ZZZZZ 36

output
60466175
*/
