// 큰 수 만들기

#warning("나중에 해보자..String subscript 사용해보자..")

import Foundation

class P_MakeBigNumber {
    func solution(_ number: String, _ k: Int) -> String {
        let digit = number.count - k
        
        let newNumber: Int = Int(number) ?? -1
        
        var max: Character = '0'
        
        if digit == 0 {
            return number
        }
        
        var idx: Int = 0
        for i in 0..<digit {
            for j in idx...(k + i) {
//                if max < number...
            }
        }
        
        return ""
    }
    
    func run() {
        print(solution("1924", 2))       // 94
        print(solution("1231234", 3))    // 3234
        print(solution("4177252841", 4)) // 775841
    }
}
